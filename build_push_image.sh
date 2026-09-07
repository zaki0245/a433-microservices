#!/bin/bash

# =============================================
# KRITERIA 3: Script Build dan Push Docker Image
# =============================================

# ##### KONFIGURASI #####
# Ganti USERNAME dengan username Docker Hub Anda!
USERNAME="mzaki0245"

# ##### PERINTAH 1 #####
# Membuat Docker image dari Dockerfile yang telah dibuat,
# dengan nama image item-app dan tag v1.
echo ">>> [1/5] Membangun Docker image item-app:v1..."
docker build -t item-app:v1 .

# ##### PERINTAH 2 #####
# Melihat daftar image yang ada di lokal (untuk verifikasi).
echo ">>> [2/5] Daftar image di lokal:"
docker images

# ##### PERINTAH 3 #####
# Mengubah nama image agar sesuai dengan format Docker Hub.
# Format: <username>/<nama-image>:<tag>
echo ">>> [3/5] Mengubah tag image ke format Docker Hub..."
docker tag item-app:v1 $USERNAME/item-app:v1

# ##### PERINTAH 4 #####
# Login ke Docker Hub via Terminal.
# Menggunakan environment variable PASSWORD_DOCKER_HUB agar password aman (tidak tertulis di script).
echo ">>> [4/5] Login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u $USERNAME --password-stdin

# ##### PERINTAH 5 #####
# Mengunggah (push) image ke Docker Hub.
echo ">>> [5/5] Mengunggah image ke Docker Hub..."
docker push $USERNAME/item-app:v1

# ##### SELESAI #####
echo ">>> Selesai! Image berhasil di-push ke Docker Hub."
echo ">>> Cek di: https://hub.docker.com/r/$USERNAME/item-app"