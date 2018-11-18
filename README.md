# README

## Ruby on Rails base app Template

There are plenty of templates out there for ruby, this is just another one.  More design around what I want in most of my apps.

Runs Rails in docker with postgres DB in another container and redis in another container as well.

Things still to do:

1. finish off all omiauth setup (google, facebook, linked-in and twitter)
2. move action cable to another container
3. setup sidekq in another container
4. css


**Work in Progress**

---

### App Signup and Security Defaults

All settings are set in `config/initializers/devise.rb` or `config/initializers/devise-security.rb`.

* `expire_password_after`         = 6 months
* `password_complexity`           = 1 digit, 1 lower case, 1 upper case, 1 symbol
* `password_archiving_count`      = 3
* `deny_old_passwords`            = 3
* `email_validation`              = true requires `gem "valid_email2"`, email domain must have correct MX records and must not be disposable email domain.
* `expire_after`                  = user account expires at 365 days since last activity
* `reset_password_within`         = 6 hours, Time interval you can reset your password with a reset password key
* `unlock_in`                     = 1 hour
* `last_attempt_warning`          = true
* `maximum_attempts`              = 5 max attempts to login
* `unlock_strategy`               = both, either unlock in or send email to unlock
* `timeout_in`                    = session timeout 30 mins
* `password_length`               = 6..128
* `remember_for`                  = remember me for 3 days
* `confirm_within`                = confirm account within 3 hours
* `allow_unconfirmed_access_for`  = 2 hours
* `send_email_changed_notification`   = true
* `send_password_change_notification` = true

### Credential File Layout

```ymal
secret_key_base:

development:
  database:
    pass: rails
  amazon:
    client_id:
    client_secret:
  twitter:
    api_key: 
    api_secret:
  google:
    client_id:
    client_secret:
    recaptcha_site_key:
    recaptcha_secret_key:
  facebook:
    facebook_key:
    facebook_secret:
  smtp:
    username: someone@gmail.com
    password: anything
  redis:
    password: yourpassword


test:
  database:
    pass: rails
  amazon:
    client_id:
    client_secret:
  twitter:
    api_key:
    api_secret:
  google:
    client_id:
    client_secret:
    recaptcha_site_key:
    recaptcha_secret_key:
  facebook:
    facebook_key:
    facebook_secret:
  smtp:
    username: someone@gmail.com
    password: anything
  redis:
    password: yourpassword

production:
  database:
    pass: somethingbetterthenthis!!!
  amazon:
    client_id: 
    client_secret:
  twitter:
    api_key: 
    api_secret:
  google:
    client_id:
    client_secret:
    recaptcha_site_key:
    recaptcha_secret_key:
  facebook:
    facebook_key:
    facebook_secret:
  smtp:
    username: someone@gmail.com
    password: anything
  redis:
    password: yourpassword
```

---

## Helpful commands

### Docker Commands

---

#### SSH onto container

`docker exec -it base-app_web_1 /bin/bash`

#### How to Build web image

`docker build -t base_app_web .`

Docker build **won't** run the app startup script!

#### Start Dev Environment

`docker-compose -f docker-compose.yml up`

#### Push image to local repo

```bash
docker login -u docker_reg https://registry.sonictexture.co.uk
docker tag base_app_web:latest registry.sonictexture.co.uk/base_app_web
docker push registry.sonictexture.co.uk/base_app_web
```


#### Push image to repo in AWS

1. `aws ecr get-login --no-include-email --region <region> --profile <environment>` - run output
2. `docker tag base-app:latest <repo>`
3. `docker push <repo>`

### Deploy to AWS ECS

`ecs-cli compose --project-name <name> --file docker-compose.yml service up --cluster <ecs cluster> --target-group-arn <target group ARN> --container-name <container name> --container-port <container port> --aws-profile <profile name> --region <region>`

### Create Volumes

`docker volume create --name base-app-postgres`

### Rails Commands

---

#### Edit credentials files

`rails credentials:edit`