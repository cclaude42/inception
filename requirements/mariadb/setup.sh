#!/bin/bash

apt -qq install -y mariadb-server > /dev/null
service mariadb start

echo "CREATE DATABASE wordpress;" | mysql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';" | mysql
echo "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

# sed -i s/"socket = \/run\/mysqld\/mysqld.sock"/"port = 3306"/g /etc/mysql/mariadb.cnf ??

/bin/bash