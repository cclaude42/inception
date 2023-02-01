#!/bin/bash

apt -qq install -y mariadb-server
service mariadb start

echo "CREATE DATABASE wordpress;" | mysql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';" | mysql
echo "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

/bin/bash