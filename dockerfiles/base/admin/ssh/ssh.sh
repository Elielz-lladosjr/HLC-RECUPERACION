#!/bin/bash
configurar_ssh() {
  echo "Configurando SSH..." >> /root/logs/informe.log
  if [ -f /etc/ssh/sshd_config ]; then
      sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
      sed -i 's/#Port.*/Port 45678/' /etc/ssh/sshd_config
  fi
  mkdir -p /run/sshd
  mkdir -p /home/eliel/.ssh
  
  if command -v /usr/sbin/sshd &> /dev/null; then
      exec /usr/sbin/sshd -D &
      echo "SSH configurado y funcionando en puerto 45678" >> /root/logs/informe.log
  fi
}

configurar_sudo() {
  if [ -d /etc/sudoers.d ]; then
      echo "eliel ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/eliel"
      chmod 0440 "/etc/sudoers.d/eliel"
      echo "Sudo configurado" >> /root/logs/informe.log
  fi
}