#!/bin/bash
crear_usuario(){
    if grep -q "^eliel:" /etc/passwd; then
        echo "El usuario eliel ya existe." >> /root/logs/informe.log
        return 1
    else
        echo "Creando usuario eliel..." >> /root/logs/informe.log
        useradd -rm -d /home/eliel -s /bin/bash eliel
        echo "eliel:asir2026" | chpasswd
        echo "Bienvenido eliel" > /home/eliel/welcome.txt
        echo "Usuario eliel creado con éxito." >> /root/logs/informe.log
        return 0
    fi
}