#!/bin/bash

set -e


export DB="$DB_DATABASE"_"$RAILS_ENV"
echo $DB


if [ "$SKIP_PSQL_AVAILABLE" = "true" ]
then
  echo "SKIPPING CHECK OF DATABASE BEING ALIVE"
else
  echo "Checking if Postgres is alive:"

  until PGPASSWORD="$DB_PASS" psql -h "$DB_HOST" -U "$DB_USER" -c '\q'; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 5
  done
  echo "Postgres is alive!"
fi

if [ "$SKIP_DB_SETUP" = "true" ]
then
  echo "SKIPPING SETUP DATABASE"
else
  echo "Checking if Database exists:"
  until PGPASSWORD="$DB_PASS" psql -h "$DB_HOST" -U "$DB_USER" -lqt | cut -d \| -f 1 | grep -qw "$DB"; do
    echo "Database doesn't exist, will run rake db:setup!"
    rake db:setup
    rake db:migrate
  done
  echo "Database has now been setup"
fi


if [ "$SKIP_DB_RESET" = "true" ]
then
  echo "SKIPPING RESETING DATABASE"
else
  echo "db reset"
  rake db:migrate
  rake db:reset
  echo "Database has now been reset"
fi

if [ "$SKIP_DB_SEED" = "true" ]
then
  echo "SKIPPING SEEDING DATABASE"
else
  echo "db seed"
  rake db:seed
  echo "Database has now been seeded"
fi


if [ "$SKIP_DB_DEPLOY" = "true" ]
then
  echo "SKIPPING DATABASE MIGRATIONS"
else
  echo "Deploying Database migrations"
  rake db:migrate
fi

if [ "$SKIP_APP_START" = "true" ]
then
  echo "NOT STARTING APP"
else
  #bundle exec rake assets:precompile
  echo "Now starting unicorn!"
  bundle exec unicorn -c config/unicorn.rb
fi