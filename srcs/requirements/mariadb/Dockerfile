FROM debian:bullseye

RUN <<EOF
    apt-get update
    apt-get install -y mariadb-server
    apt-get clean
    rm -rf /var/lib/apt/lists/*
EOF


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysqld

RUN chown -R mysql:mysql /run/mysqld

RUN mkdir -p /var/run/mysqld /docker-entrypoint-initdb.d

RUN chown -R mysql:mysql /var/lib/mysql /docker-entrypoint-initdb.d

COPY ./tools/script.sh /script.sh

RUN chmod +x /script.sh


ENTRYPOINT [ "/script.sh" ]

CMD ["mysqld_safe"]