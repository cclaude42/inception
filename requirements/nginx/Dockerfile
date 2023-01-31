FROM debian:bullseye

LABEL author="César Claude (cclaude42)"

RUN apt update && \
	apt install -y -qq nginx

RUN rm -rf /etc/nginx/sites-enabled/default && \
	rm -rf /etc/nginx/sites-available/default

COPY ./cclaude.42.fr /etc/nginx/sites-available/cclaude.42.fr

RUN ln -s /etc/nginx/sites-available/cclaude.42.fr /etc/nginx/sites-enabled/cclaude.42.fr

CMD ["nginx", "-g", "daemon off;"]