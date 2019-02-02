#!/usr/bin/env bash

echo 'Setting dns resolver will require sudo'
sudo mkdir -p /etc/respolver
sudo cp resolver/* /etc/resolver

echo "Entries created in /etc/resolver"

docker run -d --restart=always -e CONTAINER_NAME=http-proxy -p 80:80 -p 19322:19322/udp -v /var/run/docker.sock:/tmp/docker.sock:ro --name http-proxy codekitchen/dinghy-http-proxy

./setup_native_nfs_docker_osx.sh