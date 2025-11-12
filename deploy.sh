#!/bin/bash

set -e

DOCKER_USER="praveensise"     
IMAGE_NAME="myapp3"                       
TAG="latest"                              
DOCKERFILE="dockerfile"                   

echo "🔑 Logging into Docker Hub..."
docker login -u "$DOCKER_USER"

# ===== BUILD IMAGE =====
echo "🚧 Building Docker image..."
docker build -f $DOCKERFILE -t $IMAGE_NAME:$TAG .

# ===== TAG IMAGE =====
echo "🏷️ Tagging image..."
docker tag $IMAGE_NAME:$TAG $DOCKER_USER/$IMAGE_NAME:$TAG

# ===== PUSH IMAGE =====
echo "🚀 Pushing image to Docker Hub..."
docker push $DOCKER_USER/$IMAGE_NAME:$TAG

# ===== DONE =====
echo "✅ Deployment complete!"
echo "👉 You can pull it with:"
echo "   docker pull $DOCKER_USER/$IMAGE_NAME:$TAG"
