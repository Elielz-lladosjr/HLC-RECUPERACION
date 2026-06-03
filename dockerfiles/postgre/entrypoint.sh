#!/bin/bash
/usr/sbin/sshd &

service postgresql start

echo "Configurando Base de Datos..."

su - postgres -c "psql -c \"CREATE USER admin WITH PASSWORD 'admin';\""

su - postgres -c "psql -c \"CREATE DATABASE nest_db OWNER admin;\""

# 5. Convierto al usuario 'admin' en superusuario (para que NestJS pueda crear las tablas de Pokémon).
su - postgres -c "psql -c \"ALTER USER admin WITH SUPERUSER;\""

# 6. Modifico los archivos de configuración para permitir conexiones desde el exterior 
echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/13/main/pg_hba.conf
echo "listen_addresses='*'" >> /etc/postgresql/13/main/postgresql.conf

# 7. Apago el servicio temporal...
service postgresql stop

echo "Iniciando PostgreSQL en primer plano..."

# 8. Y lo arranco de forma definitiva, bloqueando la consola para que el contenedor
# no se apague y se quede ejecutando la base de datos para siempre.
su - postgres -c "/usr/lib/postgresql/13/bin/postgres -D /var/lib/postgresql/13/main -c config_file=/etc/postgresql/13/main/postgresql.conf"