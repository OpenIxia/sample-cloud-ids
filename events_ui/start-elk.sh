#!/usr/bin/env bash

if [[ `uname` == 'Linux' ]]; then
    sudo sysctl -w vm.max_map_count=262144
fi
docker-compose up -d
