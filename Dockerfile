#Ambiente de desenvolvimento
FROM php:fpm-alpine

RUN apk add --no-cache openssl bash mysql-client nodejs npm dos2unix
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
RUN rm -rf /var/www/html
RUN ln -s public html

#COPY . /var/www

# RUN composer install && \
#     cp .env.exemple .env && \
#     php artisan key:generate && \
#     php artisan config:cache

#RUN php artisan migrate

EXPOSE 9000
#COPY ./entrypoint-app.sh /entrypoint.sh
# Converte o arquivo para o formato Unix -> CRLF para LF
#RUN dos2unix /entrypoint.sh
#RUN chmod +x /entrypoint.sh
ENTRYPOINT ["php-fpm"]
