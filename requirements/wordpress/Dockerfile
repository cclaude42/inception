FROM debian:bullseye

LABEL author="César Claude (cclaude42)"

RUN apt update && \
	apt install -y -qq curl

RUN curl -LO https://wordpress.org/latest.tar.gz && \
	mkdir -p /var/www && \
	tar xzvf latest.tar.gz -C /var/www

COPY ./wp-config.php /var/www/wordpress/wp-config.php
COPY ./setup.sh /setup.sh

RUN bash /setup.sh

CMD ["sh"]