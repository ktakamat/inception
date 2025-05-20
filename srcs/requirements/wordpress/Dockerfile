FROM debian:bullseye

RUN <<EOF
    apt-get update && apt-get install -y php7.4-fpm
    apt-get update && apt-get install -y php7.4-mysqli
    apt-get update && apt-get install -y curl
    apt-get clean
    rm -rf /var/lib/apt/lists/*
EOF
RUN mkdir -p /run/php /var/www/html

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

RUN chmod 755 /usr/local/bin/docker-entrypoint.sh && chown root:root /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["php-fpm7.4", "-F"]