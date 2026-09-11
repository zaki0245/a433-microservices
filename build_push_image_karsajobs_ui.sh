#!/bin/bash
# =====================================================
# Script Build & Push Image Frontend Karsa Jobs
# Kriteria 2: Build Docker image dan push ke Docker Hub
# =====================================================

# ##### KONFIGURASI #####
# Ganti dengan username Docker Hub Anda
USERNAME="mzaki0245"

# ##### PERINTAH 1: Build Docker Image #####
# Membangun image frontend dari Dockerfile di folder ini,
# dengan nama <username>/karsajobs-ui dan tag latest.
# CATATAN: Pastikan file .env sudah berisi VUE_APP_BACKEND
# yang benar sebelum build, karena nilai ini akan di-embed
# ke dalam bundle JavaScript saat build.
echo ">>> [1/3] Build image ${USERNAME}/karsajobs-ui:latest..."
docker build -t $USERNAME/karsajobs-ui:latest .

# ##### PERINTAH 2: Login ke Docker Hub #####
echo ">>> [2/3] Login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $USERNAME --password-stdin

# ##### PERINTAH 3: Push Image ke Docker Hub #####
echo ">>> [3/3] Push image ke Docker Hub..."
docker push $USERNAME/karsajobs-ui:latest

echo ">>> Selesai! Image frontend berhasil di-push."
