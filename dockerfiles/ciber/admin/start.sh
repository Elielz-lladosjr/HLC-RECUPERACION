#!/bin/bash
load_entrypoint_base(){
    bash /root/admin/base/start.sh
}

main(){
    mkdir -p /root/logs/auditoria
    touch /root/logs/auditoria/puertos.log
    load_entrypoint_base
    /root/admin/ciber/auditoria.sh &
}
main#!/bin/bash
load_entrypoint_base(){
    bash /root/admin/base/start.sh
}

main(){
    mkdir -p /root/logs/auditoria
    touch /root/logs/auditoria/puertos.log
    load_entrypoint_base
    /root/admin/ciber/auditoria.sh &
}
main