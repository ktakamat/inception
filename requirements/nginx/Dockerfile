FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx

COPY default /etc/nginx/sites-available/.
COPY ./ssl_key/nginx.crt /etc/ssl/certs/server.crt
COPY ./ssl_key/nginx.key /etc/ssl/certs/server.key

CMD [ "nginx", "-g", "daemon off;"]