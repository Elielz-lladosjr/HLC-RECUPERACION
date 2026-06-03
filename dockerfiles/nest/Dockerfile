FROM ubseguridad:latest

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

WORKDIR /home/eliel/app 

#Copio el código fuente de mi API
COPY proyecto/tarea-api-nest/ /home/eliel/app/

RUN npm install
RUN npm run build

RUN chown -R eliel:eliel /home/eliel

EXPOSE 3000 22
#script de arraque binarios
COPY dockerfiles/nest/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

USER eliel
# proceso principal del contenedor
ENTRYPOINT ["/usr/local/bin/start.sh"]