FROM debian:bullseye

LABEL author="César Claude (cclaude42)"

# Install curl
RUN apt -qq update -y && \
	apt -qq install -y curl

# Get PHP APT keys
RUN apt -qq install -y gnupg2 ca-certificates apt-transport-https software-properties-common && \
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
	curl --output - https://packages.sury.org/php/apt.gpg | apt-key add -

# Install PHP
RUN	apt -qq update -y && \
	apt -qq install -y php8.2 php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql

# Download Wordpress
RUN curl -LO https://wordpress.org/latest.tar.gz && \
	mkdir -p /var/www && \
	tar xzvf latest.tar.gz -C /

# Copy Wordpress config and setup script
COPY ./wp-config.php /wordpress/wp-config.php
COPY ./setup.sh /setup.sh

# Run setup script
CMD ["/bin/bash", "/setup.sh"]
