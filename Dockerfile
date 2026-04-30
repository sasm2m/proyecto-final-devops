# Etapa 1: Build / preparación de artefactos estáticos
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci || npm install

COPY src/ ./src/

RUN mkdir -p /app/dist && cp -r ./src/* /app/dist/


# Etapa 2: Imagen final liviana con NGINX
FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]