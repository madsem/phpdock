ARG MY_PHP_VERSION
FROM --platform=linux/amd64 madsem/phpdock:${MY_PHP_VERSION}

RUN composer self-update

# Install additional extensions, packages etc.
#RUN install-php-extensions csv decimal

# Customize PHP config
#COPY php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html
