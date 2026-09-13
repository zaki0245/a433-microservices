# Base image: Node.js 18 Alpine (ringan, cocok untuk production)
FROM node:18-alpine

# Set working directory di dalam container
WORKDIR /app

# Copy manifest dependencies terlebih dahulu untuk optimasi layer cache
COPY package*.json ./

# Install dependencies tanpa devDependencies
RUN npm ci --only=production

# Copy seluruh source code ke dalam container
COPY . .

# Expose port aplikasi
EXPOSE 3000

# Perintah default saat container dijalankan
CMD ["npm", "start"]
