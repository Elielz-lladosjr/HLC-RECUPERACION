#!/bin/bash
# 1. Defino la ruta donde guardaré los registros de seguridad y la creo si no existe
LOG_DIR="/root/logs"
LOG_FILE="$LOG_DIR/eliel_audit_ports.log"
mkdir -p "$LOG_DIR"
# 2. Creo una función que registra la fecha exacta y los puertos que están abiertos
eliel_audit() {
    echo "=== AUDITORÍA DE ELIEL - $(date) ===" >> "$LOG_FILE"
    echo "Puertos escuchando (TCP/UDP):" >> "$LOG_FILE"
    ss -tulnp >> "$LOG_FILE" 2>&1
    echo "-----------------------------------" >> "$LOG_FILE"
}

# Ejecutar auditoría cada 60 segundos en segundo plano
while true; do
    eliel_audit
    sleep 60
done &