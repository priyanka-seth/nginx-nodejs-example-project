#!/bin/bash
set -e

AWS_REGION="ap-south-1"                  # 🔹 change to your AWS region
ACCOUNT_ID="990738782367"           # 🔹 replace with your AWS account ID
IMAGE_REPO_NAME="my-node-app"
IMAGE_TAG="latest"

echo "=== Logging in to Amazon ECR ==="
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

cd /home/ec2-user/app

echo "=== Pulling latest image from ECR ==="
docker-compose pull

echo "=== Restarting services with Docker Compose ==="
docker-compose up -d --remove-orphans

echo "=== Deployment finished successfully ==="
