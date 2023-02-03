#!/bin/bash

# Create DB and USER
service mariadb start
sleep 3
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
mysql -e "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Stop MariaDB
service mariadb stop
sleep 3

# Run MariaDB in foreground
/usr/bin/mysqld_safe
