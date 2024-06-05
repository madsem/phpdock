FROM node:15.14-alpine3.11 as node
FROM --platform=linux/amd64 nginx:1.20.0-alpine

LABEL maintainer="Klever <riepenmarc@gmail.com>"

ENV TZ=UTC

# --virtual creates a virtual bundle of packages to get node, npm & yarn
RUN apk add --update --no-cache --virtual=buildNode g++ && \
    mkdir -p /var/www/html

COPY h5bp /etc/nginx/h5bp
COPY mime.types /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/*.conf /etc/nginx/conf.d/

# node command
COPY --from=node /usr/local/bin /usr/local/bin
# npm command
COPY --from=node /usr/local/lib /usr/local/lib
# yarn command
COPY --from=node /opt /opt

# Create user, group for php-fpm & nginx 
RUN addgroup -g 1000 -S phpdock && \
  adduser -u 1000 -S -D -G phpdock phpdock

WORKDIR /var/www/html