FROM nginx:alpine
RUN apk add --no-cache bash
RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /var/www
COPY ./nginx.conf /etc/nginx/conf.d

