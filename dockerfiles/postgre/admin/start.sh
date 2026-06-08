#!/bin/bash
LOG_DIR="/root/logs"
LOG_FILE="$LOG_DIR/informe_postgre.log"

PG_USER="admin"
PG_PASSWORD="admin"
PG_DATABASE="nest_db"
PG_PORT="5432"

PG_VERSION=$(ls /usr/lib/postgresql/ | sort -V | tail -1)
PG_BIN="/usr/lib/postgresql/$PG_VERSION/bin"
PGDATA="/var/lib/postgresql/data/pgdata"

log() {
    echo "$1"
    echo "$1" >> "$LOG_FILE"
}

load_entrypoint_ciber() {
    log "Ejecutando entrypoint de ciberseguridad..."
    if [ -f /root/admin/ciber/start.sh ]; then
        bash /root/admin/ciber/start.sh || log "ADVERTENCIA: Entrypoint ciber falló."
    else
        log "ADVERTENCIA: No se encontró start.sh de ciber"
    fi
}

inicializar_cluster() {
    if [ ! -f "$PGDATA/PG_VERSION" ]; then
        su - postgres -c "$PG_BIN/initdb -D $PGDATA"
    fi
}

configurar_acceso() {
    sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PGDATA/postgresql.conf"
    sed -i "s/#port = 5432/port = $PG_PORT/" "$PGDATA/postgresql.conf"
    if ! grep -q "host all all 0.0.0.0/0 md5" "$PGDATA/pg_hba.conf"; then
        echo "host all all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
    fi
}

crear_usuario_y_bd() {
    su - postgres -c "$PG_BIN/pg_ctl -D $PGDATA start -w"
    su - postgres -c "psql -c \"CREATE USER $PG_USER WITH PASSWORD '$PG_PASSWORD';\"" 2>/dev/null || true
    su - postgres -c "psql -c \"ALTER USER $PG_USER WITH PASSWORD '$PG_PASSWORD';\""
    su - postgres -c "psql -c \"ALTER USER $PG_USER WITH SUPERUSER;\""
    su - postgres -c "psql -tc \"SELECT 1 FROM pg_database WHERE datname='$PG_DATABASE'\"" | grep -q 1 || \
    su - postgres -c "psql -c \"CREATE DATABASE $PG_DATABASE OWNER $PG_USER;\""
    su - postgres -c "$PG_BIN/pg_ctl -D $PGDATA stop -w"
}

main() {
    mkdir -p "$LOG_DIR"
    touch "$LOG_FILE"
    
    load_entrypoint_ciber
    inicializar_cluster
    configurar_acceso
    crear_usuario_y_bd
    
    log "Arrancando PostgreSQL en primer plano..."
    exec su - postgres -c "$PG_BIN/postgres -D $PGDATA"
}

main