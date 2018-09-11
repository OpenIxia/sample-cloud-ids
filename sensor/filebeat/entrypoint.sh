#!/bin/sh

if [ $# -ne 1 ]
  then
    echo "Please provide the ELK IP or hostname"
    exit 1
fi

rm -f /usr/share/filebeat/filebeat.yml
sed -e "s/\${host}/$1/" /filebeat_template.yml > /usr/share/filebeat/filebeat.yml
chmod go-w /usr/share/filebeat/filebeat.yml

exec /usr/local/bin/docker-entrypoint "-e"
