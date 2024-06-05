ARG MY_PHP_VERSION
FROM --platform=linux/amd64 madsem/phpdock:${MY_PHP_VERSION}

# Install additional extensions, packages etc.
#RUN install-php-extensions csv decimal

# Customize PHP config
#COPY php.ini /usr/local/etc/php/php.ini
RUN set -xe \
    && apk update \
    && apk upgrade \
    && composer self-update

WORKDIR /var/www/html
