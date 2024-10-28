#!/bin/bash

echo "ALTER USER '${MYSQL_ROOT_HOST}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" > /docker-entrypoint-initdb.d/init.sql

echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.d/init.sql

echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" >> /docker-entrypoint-initdb.d/init.sql

echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /docker-entrypoint-initdb.d/init.sql

echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';" >> /docker-entrypoint-initdb.d/init.sql

echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.d/init.sql

rm -rf /var/lib/mysql/*

mysql_install_db --datadir=/var/lib/mysql --user=mysql

exec "$@"