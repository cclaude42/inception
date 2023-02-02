#!/bin/bash

# Copy Wordpress files
cp -rn /wordpress/* /var/www/html

# Configure Wordpress
sed -i s/ENV_GET_USER/$MYSQL_USER/g /var/www/html/wp-config.php
sed -i s/ENV_GET_PASS/$MYSQL_PASS/g /var/www/html/wp-config.php

# Configure PHP-FPM
echo "listen = 9000" >> /etc/php/8.2/fpm/pool.d/www.conf

# Start PHP-FPM
service php8.2-fpm start

# Keep running
/bin/bash
