#!/bin/bash
sed -i s/ENV_GET_USER/$MYSQL_USER/g /var/www/wordpress/wp-config.php
sed -i s/ENV_GET_PASS/$MYSQL_PASS/g /var/www/wordpress/wp-config.php