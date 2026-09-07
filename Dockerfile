# Kriteria 2: Dockerfile untuk aplikasi Item App

# 1. Menggunakan base image Node.js versi 14
FROM node:14

# 2. Menentukan working directory di dalam container adalah /app
WORKDIR /app

# 3. Menyalin seluruh source code ke working directory di container
COPY . .

# 4. Menentukan environment variable:
#    - NODE_ENV=production (aplikasi berjalan di mode production)
#    - DB_HOST=item-db (menggunakan container item-db sebagai host database)
ENV NODE_ENV=production \
    DB_HOST=item-db

# 5. Menginstal dependencies untuk production dan melakukan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# 6. Mengekspos bahwa port yang digunakan oleh aplikasi adalah 8080
EXPOSE 8080

# 7. Saat container diluncurkan, jalankan server dengan perintah npm start
CMD ["npm", "start"]