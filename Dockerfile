FROM alpine:latest

RUN apk update; \
    apk add php8 php8-mbstring php8-curl php8-phar php8-openssl

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php composer-setup.php; \
    php -r "unlink('composer-setup.php');"; \
    mv composer.phar /usr/local/bin/composer;

COPY . /tmp
WORKDIR /tmp

RUN composer install;

ENTRYPOINT ["php", "-S", "0.0.0.0:4000", "-t", "/tmp/src"]
