FROM alpine:latest

RUN apk update; \
    apk add php8;

COPY . /tmp

ENTRYPOINT ["php", "-S", "0.0.0.0:4000", "-t", "/tmp/src"]
