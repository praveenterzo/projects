#!/bin/bash

set -e


IMAGE_NAME="myapp3"
IMAGE_TAG="latest"

echo "========================================"
echo " Building Docker image: $IMAGE_NAME:$IMAGE_TAG"
echo "========================================"

docker build -t $IMAGE_NAME:$IMAGE_TAG -f dockerfile .

echo "✅ Docker image built successfully!"
echo "----------------------------------------"
docker images | grep $IMAGE_NAME

echo
read -p "Do you want to run the container now? (y/n): " run_choice
if [ "$run_choice" = "y" ] || [ "$run_choice" = "Y" ]; then
  echo "Starting container on port 8080..."
  docker run -d -p 8081:80 $IMAGE_NAME:$IMAGE_TAG
  echo "🌐 Your app is now available at http://localhost:8080"
else
  echo "You can start the container anytime using:"
  echo "docker run -d -p 8081:80 $IMAGE_NAME:$IMAGE_TAG"
fi
