#!/bin/bash

cp -rn /wordpress/* /var/www/html

sed -i s/ENV_GET_USER/$MYSQL_USER/g /var/www/html/wp-config.php
sed -i s/ENV_GET_PASS/$MYSQL_PASS/g /var/www/html/wp-config.php

echo "listen = 9000" >> /etc/php/8.2/fpm/pool.d/www.conf
service php8.2-fpm start

/bin/bash