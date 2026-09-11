#!/bin/bash
# =====================================================
# Script Build & Push Image Backend Karsa Jobs
# Kriteria 2: Build Docker image dan push ke Docker Hub
# =====================================================

# ##### KONFIGURASI #####
# Ganti dengan username Docker Hub Anda
USERNAME="mzaki0245"

# ##### PERINTAH 1: Build Docker Image #####
# Membangun image backend dari Dockerfile di folder ini,
# dengan nama <username>/karsajobs dan tag latest.
echo ">>> [1/3] Build image ${USERNAME}/karsajobs:latest..."
docker build -t $USERNAME/karsajobs:latest .

# ##### PERINTAH 2: Login ke Docker Hub #####
# Login menggunakan environment variable PASSWORD_DOCKER_HUB
# agar password tidak tertulis di dalam script.
echo ">>> [2/3] Login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $USERNAME --password-stdin

# ##### PERINTAH 3: Push Image ke Docker Hub #####
# Mengunggah image ke Docker Hub agar bisa diakses publik.
echo ">>> [3/3] Push image ke Docker Hub..."
docker push $USERNAME/karsajobs:latest

echo ">>> Selesai! Image backend berhasil di-push."
