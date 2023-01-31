FROM debian:bullseye

LABEL author="César Claude (cclaude42)"

RUN apt update && \
	apt install -y -qq nginx

CMD ["nginx", "-g", "daemon off;"]