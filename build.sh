#!/usr/bin/env bash

BASE=tomplex
IMAGE_NAME=python-postgres
TAG=3.5

IMG=$BASE/$IMAGE_NAME:$TAG

docker build -t $IMG -t $IMG_LATEST .
docker push $IMG
