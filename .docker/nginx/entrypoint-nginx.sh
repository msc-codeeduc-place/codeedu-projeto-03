#!/bin/bash

# Nesse momento posso acessar o volume sem problemas.
# Trecho da configuração no docker-compose.yaml.
#  volumes:
#      - .:/var/www
cp ./.docker/nginx/nginx.conf:/etc/nginx/conf.d/nginx.conf
nginx -g 'daemon off;'
