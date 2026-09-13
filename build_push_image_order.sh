#!/bin/bash
# Script build dan push image Order Service ke Docker Hub

# Konfigurasi
USERNAME="mzaki0245"

# Tahap 1: Build image dari Dockerfile
echo ">>> [1/3] Building image ${USERNAME}/order-service:latest..."
docker build -t $USERNAME/order-service:latest .

# Tahap 2: Autentikasi ke Docker Hub
# Password diambil dari environment variable untuk menghindari hardcoding
echo ">>> [2/3] Logging in to Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $USERNAME --password-stdin

# Tahap 3: Push image ke registry
echo ">>> [3/3] Pushing image to Docker Hub..."
docker push $USERNAME/order-service:latest

echo ">>> Done. Image order-service telah berhasil di-push."
