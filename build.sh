#!/usr/bin/env bash

# Just change the repository name
REPOSITORY=python36-postgres
ECR=244784345394.dkr.ecr.us-east-2.amazonaws.com

IMG=$ECR/$REPOSITORY:$BUILD_ID
IMG_LATEST=$ECR/$REPOSITORY:latest

$(aws ecr get-login --no-include-email --region us-east-2)

docker build -t $IMG -t $IMG_LATEST .
docker push $IMG
docker push $IMG_LATEST
