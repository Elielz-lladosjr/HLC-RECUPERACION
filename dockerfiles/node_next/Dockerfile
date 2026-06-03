FROM ubseguridad:latest

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

WORKDIR /home/eliel/frontend

# 4. Copio todo el código de la Pokédex al contenedor
COPY proyecto/Poke-app/mi-pokedex/ .

RUN npm install && npm install -g serve
RUN chown -R eliel:eliel /home/eliel

EXPOSE 3000 22

USER eliel

COPY dockerfiles/node_next/start.sh /usr/local/bin/eliel-start.sh

# 10. Defino mi script personalizado como proceso principal
ENTRYPOINT ["bash", "/usr/local/bin/eliel-start.sh"]