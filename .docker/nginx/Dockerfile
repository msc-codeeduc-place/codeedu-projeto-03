FROM nginx:alpine
RUN apk add --no-cache bash dos2unix
RUN rm /etc/nginx/conf.d/default.conf
ENV APP_ENV $APP_ENV
ENV DOCKERIZE_VERSION v0.6.1
RUN echo $APP_ENV
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz &&\
 tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www

#No ponto de vista da contrução, estou dentro de ./.docker/nginx
#build: .docker/nginx

COPY ./entrypoint-nginx.sh /entrypoint.sh
# Converte o arquivo para o formato Unix -> CRLF para LF
RUN dos2unix /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
