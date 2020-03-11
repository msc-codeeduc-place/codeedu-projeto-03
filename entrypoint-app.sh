#!/bin/bash

# Nesse momento posso acessar o volume sem problemas.
# Trecho da configuração no docker-compose.yaml.
#  volumes:
#      - .:/var/www
dockerize -template ./env.tmpl:./.env -wait tcp://db:3306

chown -R www-data:www-data /var/www/storage
chmod -R 755 /var/www/storage

composer install
php artisan key:generate
php artisan config:cache
php artisan migrate
php-fpm
