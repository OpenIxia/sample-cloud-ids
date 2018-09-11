FROM docker.elastic.co/beats/filebeat:6.2.4

LABEL Author="Ixia Cloudlens Engineering <cloudlens@keysight.com>" \
      Description="GameDay ELK Exporter" \
      Usage="TBD" \
      Vendor="Ixia" \
      Comment="6/7/2018: Initial Version"

COPY filebeat_template.yml /filebeat_template.yml
COPY entrypoint.sh /entrypoint.sh

USER root

RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
