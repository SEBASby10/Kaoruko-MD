FROM node:18-bullseye

# Instalar dependencias del sistema (FFmpeg y WebP)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    imagemagick \
    libwebp-dev \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos del bot
COPY package.json .
RUN npm install

COPY . .

# Comando para iniciar el bot
CMD ["npm", "start"]
