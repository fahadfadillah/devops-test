#!/bin/bash
set -e

APP_NAME="Dev-nodejs"
IMAGE_NAME="dev-app:latest"

echo "=== [1] Update source (dummy) ==="
mkdir -p /opt/app/src
echo "deploy $(date)" > /opt/app/src/version.txt

echo "=== [2] Build Docker image ==="
docker build -t $IMAGE_NAME /opt/docker-app

echo "=== [3] Stop & remove old container (if exists) ==="
docker stop $APP_NAME 2>/dev/null || true
docker rm $APP_NAME 2>/dev/null || true

echo "=== [4] Run new container (host network) ==="
docker run -d \
  --name $APP_NAME \
  --restart always \
  --network host \
  $IMAGE_NAME

echo "=== Deploy finished ==="
