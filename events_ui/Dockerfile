FROM sebp/elk:640

LABEL Author="Ixia Cloudlens Engineering <cloudlens@keysight.com>" \
      Description="GameDay ELK" \
      Usage="TBD" \
      Vendor="Ixia" \
      Comment="6/7/2018: Initial Version"

RUN apt-get install wget
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN pip3 install requests

COPY kibana_importer.py /var/kibana/kibana_importer.py
COPY kibana_dashboard.json /var/kibana/kibana_dashboard.json
COPY elk-post-hooks.sh /usr/local/bin/elk-post-hooks.sh

COPY 30-output.conf /etc/logstash/conf.d/30-output.conf

COPY 02-beats-input.conf /etc/logstash/conf.d/02-beats-input.conf
