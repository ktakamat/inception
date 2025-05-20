FROM debian:bullseye

RUN <<EOF
    apt-get update
    apt-get install -y nginx\
    openssl
    apt-get clean
    rm -rf /var/lib/apt/lists/*
EOF

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "nginx", "-g", "daemon off;"]