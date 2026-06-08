FROM eliel-ciber:latest
USER root

# Añadir repositorio oficial e instalar PostgreSQL 15
RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 lsb-release curl ca-certificates \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update && apt-get install -y --no-install-recommends postgresql-15 postgresql-client-15 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/postgresql/data && chown -R postgres:postgres /var/lib/postgresql/data

RUN mkdir -p /root/admin/postgre
WORKDIR /root/admin/postgre
COPY ./dockerfiles/postgre/admin/ /root/admin/postgre/
RUN chmod +x /root/admin/postgre/start.sh

EXPOSE 5432
ENTRYPOINT ["/root/admin/postgre/start.sh"]