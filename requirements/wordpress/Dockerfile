FROM debian:bullseye

LABEL author="César Claude (cclaude42)"

RUN apt -qq update -y && \
	apt -qq install -y curl

RUN apt -qq install -y gnupg2 ca-certificates apt-transport-https software-properties-common && \
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
	curl --output - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN	apt -qq update -y && \
	apt -qq install -y php8.2 php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql

RUN curl -LO https://wordpress.org/latest.tar.gz && \
	mkdir -p /var/www && \
	tar xzvf latest.tar.gz -C /

COPY ./wp-config.php /wordpress/wp-config.php
COPY ./setup.sh /setup.sh

EXPOSE 9000

CMD ["/bin/bash", "/setup.sh"]