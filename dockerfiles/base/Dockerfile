FROM ubuntu:22.04
USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl sudo iproute2 iputils-ping net-tools openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/admin/base
WORKDIR /root/admin/base
COPY ./dockerfiles/base/admin/ /root/admin/base/
RUN chmod +x /root/admin/base/start.sh /root/admin/base/ssh/ssh.sh /root/admin/base/usuario/crearusuario.sh

ENTRYPOINT ["/root/admin/base/start.sh"]