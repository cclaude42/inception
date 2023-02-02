FROM debian:bullseye

LABEL author="César Claude (cclaude42)"

RUN apt -qq update -y

COPY ./setup.sh /setup.sh

CMD ["/bin/bash", "/setup.sh"]
