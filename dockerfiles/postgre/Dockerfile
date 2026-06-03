FROM ubseguridad:latest

RUN apt-get update && apt-get install -y postgresql-13 postgresql-contrib \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/postgresql/data /var/run/postgresql \
    && chown -R postgres:postgres /var/lib/postgresql /var/run/postgresql \
    && chmod 777 /var/run/postgresql

# Apunta al script exacto
COPY dockerfiles/postgre/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 5432 22

USER postgres

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]