FROM eliel-base:latest
USER root

RUN apt-get update && apt-get install -y \
    nmap hydra tcpdump && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/admin/ciber
WORKDIR /root/admin/ciber
COPY ./dockerfiles/ciber/admin/ /root/admin/ciber/
RUN chmod +x /root/admin/ciber/start.sh /root/admin/ciber/auditoria.sh

ENTRYPOINT ["/root/admin/ciber/start.sh"]FROM eliel-base:latest
USER root

RUN apt-get update && apt-get install -y \
    nmap hydra tcpdump && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/admin/ciber
WORKDIR /root/admin/ciber
COPY ./dockerfiles/ciber/admin/ /root/admin/ciber/
RUN chmod +x /root/admin/ciber/start.sh /root/admin/ciber/auditoria.sh

ENTRYPOINT ["/root/admin/ciber/start.sh"]