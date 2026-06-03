#!/bin/bash
# 1. Ejecutamos el script de seguridad en segundo plano para que se ejecute junto con la aplicación NestJS
bash /home/eliel/scripts/eliel-security.sh &

# 2. Me ubico en mi directorio de trabajo aislado
cd /home/eliel/app
# 3. Instalo las dependencias y compilo el código fuente de NestJS
npm install
npm run build

#para levantar la API en modo producción
npm run start:prod