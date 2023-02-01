#!/bin/bash

cp -r /wordpress/* /var/www/

sed -i s/ENV_GET_USER/$MYSQL_USER/g /var/www/wp-config.php
sed -i s/ENV_GET_PASS/$MYSQL_PASS/g /var/www/wp-config.php

/bin/bash