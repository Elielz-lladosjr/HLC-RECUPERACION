#!/bin/bash
source /root/admin/base/usuario/crearusuario.sh
source /root/admin/base/ssh/ssh.sh

main(){
    mkdir -p /root/logs
    touch /root/logs/informe.log
    crear_usuario
    configurar_ssh
    configurar_sudo
}
main