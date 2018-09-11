FROM phusion/baseimage

LABEL Author="Ixia Cloudlens Engineering <cloudlens@keysight.com>" \
      Description="GameDay Snort Sensors to Detect Exploits on Reduced Damn Small Vulnerable Web Application" \
      Usage="TBD" \
      Vendor="Ixia" \
      Comment="5/24/2018: Initial Version"

RUN apt-get -y -qq update --fix-missing \
    && DEBIAN_FRONTEND=noninteractive apt-get -y -qq --no-install-recommends install \
            net-tools \
            iputils-ping \
            snort \
            patch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root/

# configure rules to detect exploits exposed by rdsvw
COPY local.rules /etc/snort/rules/local.rules

# configure csv output plugin to write out to /var/log/snort/alert.csv
# /var/log/snort should be a volume mount when container is launched
COPY snort.conf.patch /tmp/snort.conf.patch
RUN cd /etc/snort && \
    patch < /tmp/snort.conf.patch && \
    rm /tmp/snort.conf.patch

ENTRYPOINT ["/sbin/my_init", "--", "snort", "-q", "-c", "/etc/snort/snort.conf", "-k", "none"]
CMD ["-i", "eth0"]
