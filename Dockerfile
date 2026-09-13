# Base image: Node.js 18 Alpine (konsisten dengan order service)
FROM node:18-alpine

# Set working directory di dalam container
WORKDIR /app

# Copy manifest dependencies untuk optimasi layer cache
COPY package*.json ./

# Install dependencies production
RUN npm ci --only=production

# Copy source code aplikasi
COPY . .

# Expose port aplikasi
EXPOSE 3001

# Perintah default saat container dijalankan
CMD ["npm", "start"]
