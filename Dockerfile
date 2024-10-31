# Usar una imagen base de Node.js
FROM node:18-alpine

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos de dependencias
COPY package.json pnpm-lock.yaml ./

# Instalar pnpm en el contenedor
RUN npm install -g pnpm

# Instalar las dependencias
RUN pnpm install

# Copiar el resto del código de la aplicación al contenedor
COPY . .

# Construir la aplicación para producción
RUN pnpm exec svelte-kit build

# Exponer el puerto en el que la aplicación será ejecutada
EXPOSE 3000

# Comando para iniciar la aplicación en modo producción
CMD ["node", "build"]
