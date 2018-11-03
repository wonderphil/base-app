# README

```
docker volume create --name base-app-postgres
# docker volume create --name base-app-redis
```

## Docker Commands:
---

### SSH onto container:
`docker exec -it base_app_web /bin/bash`

### How to Build web image:
`docker build -t base_app_web .`

Docker build **won't** run the app startup script!

### Start Dev Environment
`docker-compose -f docker-compose.yml up`

### Push image to repo:
1. `aws ecr get-login --no-include-email --region eu-west-1 --profile bbstage ` - run output
2. `docker tag bbir:latest 495749002756.dkr.ecr.eu-west-1.amazonaws.com/bbir:latest`
3. `docker push 495749002756.dkr.ecr.eu-west-1.amazonaws.com/bbir:latest`

### Deploy to stage:
`ecs-cli compose --project-name bbir-stage --file docker-compose.stage.yml service up --cluster bbstage-aws-shared-ecs-ecs-cluster --target-group-arn arn:aws:elasticloadbalancing:eu-west-1:495749002756:targetgroup/bbstage-bbir-tg/3d31a3c649b25c04 --container-name web --container-port 8000 --aws-profile bbstage --region eu-west-1`

`rails credentials:edit`



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