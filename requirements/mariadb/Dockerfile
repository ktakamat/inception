FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server


COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN mkdir -p /var/run/mysqld /docker-entrypoint-initdb.d

RUN chown -R mysql:mysql /var/lib/mysql

COPY ./script.sh /script.sh

RUN chmod +x /script.sh


ENTRYPOINT [ "/script.sh" ]

CMD ["mysqld_safe"]