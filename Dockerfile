# 01_manifiesto_core: Uso de versiones específicas para inmutabilidad
FROM nginx:1.25-alpine

# Metadatos del proyecto
LABEL maintainer="Arquitectura Johan Kepler"
LABEL project="Demo Institucional Johan Kepler"
LABEL authors="rcubias"

# 1. Copiamos el archivo principal
COPY index.html /usr/share/nginx/html/index.html

# 2. Copiamos la carpeta de activos (assets) completa
# Esto mantendrá la estructura interna en el servidor
COPY assets /usr/share/nginx/html/assets

# Exposición del puerto estándar
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]