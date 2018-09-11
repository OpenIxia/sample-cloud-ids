# Reduced Damn Small Vulnerable Web Application in alpine linux
#
# docker run -p 6200:6200 -d --name vulnerable_app rdsvw

FROM alpine:3.7
LABEL Author="Ixia Cloudlens Engineering <cloudlens@keysight.com>" \
      Description="Reduced Damn Small Vulnerable Web Application" \
      Usage="docker run -p 6200:6200 -d --name vulnerable_app rdsvw" \
      Vendor="Ixia" \
      Comment="5/23/2018: Initial Version"

RUN apk --no-cache add tini python py-lxml \
        && rm -rf /var/cache/apk/*

ADD dsvw.py /dsvw.py

EXPOSE 6200

ENTRYPOINT ["/sbin/tini", "--", "python"]
CMD ["/dsvw.py"]
