#!/bin/bash
set -euo pipefail

IMAGE_NAME="csesudhirs/react-ci-cd"   # ✅ Matches your Docker Hub repo
TAG="latest"
CONTAINER_NAME="react"
HOST_PORT="${HOST_PORT:-8080}"

echo "[1/5] Docker login"
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "[2/5] Remove old container if exists"
docker rm -f "$CONTAINER_NAME" || true

echo "[3/5] Build image"
docker build -t "${IMAGE_NAME}:${TAG}" .

echo "[4/5] Run container"
docker run -d --name "$CONTAINER_NAME" --restart unless-stopped -p ${HOST_PORT}:80 "${IMAGE_NAME}:${TAG}"

echo "[5/5] Push image"
docker push "${IMAGE_NAME}:${TAG}"

