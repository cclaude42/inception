#!/bin/bash

# Install MariaDB
apt -qq install -y mariadb-server > /dev/null

# Configure MariaDB
sed -i s/"127.0.0.1"/"*"/g /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i s/"socket ="/"# "/g /etc/mysql/mariadb.cnf

# Create DB and USER
service mariadb start
sleep 5
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
mysql -e "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Restart MariaDB
service mariadb restart

# Keep running
/bin/bash
