FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.4-fpm
RUN apt-get update && apt-get install -y php7.4-mysqli
RUN apt-get update && apt-get install -y curl
RUN mkdir -p /run/php /var/www/html

COPY www.conf /etc/php/7.4/fpm/pool.d/.
COPY script.sh /usr/local/bin/script.sh

RUN chmod 755 /usr/local/bin/script.sh && chown root:root /usr/local/bin/script.sh

ENTRYPOINT ["/usr/local/bin/script.sh"]

CMD ["php-fpm7.4", "-F"]