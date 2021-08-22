#!/bin/bash
VERION=${1:-latest}
IMAGE_NAME=${2:-aeslabs/aeschain-base}

# require login first
docker build -t $IMAGE_NAME:$VERION -t $IMAGE_NAME:latest .

# docker push  
docker push -a $IMAGE_NAME