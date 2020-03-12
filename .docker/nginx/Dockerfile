FROM nginx:alpine
RUN apk add --no-cache bash
RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /var/www

#No ponto de vista da contrução, estou dentro de ./.docker/nginx
#build: .docker/nginx

#COPY ./entrypoint-nginx.sh /entrypoint.sh
# Converte o arquivo para o formato Unix -> CRLF para LF
#RUN dos2unix /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]
