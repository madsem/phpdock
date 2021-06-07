FROM php:8-fpm-alpine

LABEL maintainer="Klever <riepenmarc@gmail.com>"

# timezone environment
ENV TZ=UTC \
  # locale
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_ALL=en_US.UTF-8 \
  # composer environment
  COMPOSER_ALLOW_SUPERUSER=1 \
  COMPOSER_HOME=/composer

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN apk add --update --no-cache git && \
  chmod +x /usr/local/bin/install-php-extensions && \
  sync && \
  install-php-extensions redis \
  pdo_mysql \
  zip \
  intl \
  bcmath \
  soap \
  gd \
  exif \
  imagick \
  maxminddb

# Remove docker default php-fpm config files
RUN rm -rf /usr/local/etc/php-fpm.d/*

COPY php-fpm.d/www.conf /usr/local/etc/php-fpm.d/phpdock-www.conf
COPY php.ini /usr/local/etc/php/php.ini

# Create user, group & socket directory for php-fpm socket
# Chown files & directories needed by php & composer
RUN addgroup -g 1000 -S phpdock && \
  adduser -u 1000 -S -D -G phpdock phpdock && \
  mkdir /socket && \
  mkdir /composer && \
  touch /socket/php-fpm.sock && \
  chown -R phpdock:phpdock /socket/php-fpm.sock /var/www/html /composer

VOLUME [ "/socket" ]

WORKDIR /var/www/html