# 01_manifiesto_core: Uso de versiones específicas para inmutabilidad
FROM nginx:1.25-alpine

# Metadatos del proyecto
LABEL maintainer="Arquitectura Johan Kepler"
LABEL project="Demo Institucional Assets"

# 1. Copiamos el archivo principal (index.html)
COPY index.html /usr/share/nginx/html/index.html

# 2. Copiamos la carpeta de activos (assets) completa
# Usamos el slash al final para asegurar que se copie el contenido en la ruta destino
COPY assets/ /usr/share/nginx/html/assets/

# 3. SEGURIDAD Y CONTROL: Ajuste de permisos
# Nginx corre como un usuario sin privilegios en entornos endurecidos.
# Aseguramos que los archivos sean legibles por el servidor.
RUN chmod -R 755 /usr/share/nginx/html

# Exposición del puerto estándar para tráfico HTTP
EXPOSE 80

# NOTA ARQUITECTÓNICA: No se define ENTRYPOINT para heredar el script oficial 
# de Nginx Alpine. CMD proporciona los argumentos de ejecución.
CMD ["nginx", "-g", "daemon off;"]
