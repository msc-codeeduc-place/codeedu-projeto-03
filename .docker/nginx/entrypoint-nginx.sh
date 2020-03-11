#!/bin/bash

# Nesse momento posso acessar o volume sem problemas.
# Trecho da configuração no docker-compose.yaml.
#  volumes:
#      - .:/var/www
dockerize -template ./.docker/nginx/nginx.tmpl:/etc/nginx/conf.d/nginx.conf

nginx -g 'daemon off;'
