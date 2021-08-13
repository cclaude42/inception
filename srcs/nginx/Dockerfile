FROM debian:buster

LABEL author="César Claude (cclaude42)"

RUN apt update && \
	apt install nginx

EXPOSE 443

CMD nginx -g "daemon off;"