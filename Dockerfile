#Ambiente de desenvolvimento
FROM php:fpm-alpine

RUN apk add --no-cache openssl bash mysql-client nodejs npm dos2unix
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

ENV DOCKERIZE_VERSION v0.6.1

RUN echo $APP_ENV

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN rm -rf /var/www/html
RUN ln -s public html
EXPOSE 9000
# Copia o script para a raiz do contexto de construção
# build: .
COPY ./entrypoint-app.sh /entrypoint.sh
# Converte o arquivo para o formato Unix -> CRLF para LF
RUN dos2unix /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
