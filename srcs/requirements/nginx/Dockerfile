FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx\
    openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "nginx", "-g", "daemon off;"]