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