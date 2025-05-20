#!/bin/bash
mkdir -p /var/www/html/wordpress
chown -R www-data:www-data /var/www/html
if [ ! -n "$(ls -A /var/www/html/wordpress)" ]; then
cd /var/www/html/wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
sleep 3
./wp-cli.phar config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root
./wp-cli.phar core install --url=${URL} --title=${TITLE} --admin_user=${ADMIN} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root
./wp-cli.phar user create ktakamat ktakamat@ktakamat.com --role=author --display_name=ktakamat --user_pass=${USER_PASSWORD} --allow-root
./wp-cli.phar plugin install broken-link-checker contact-form-7 --activate --allow-root

fi

exec "$@"