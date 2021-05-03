ARG MY_MYSQL_VERSION
FROM mysql/mysql-server:${MY_MYSQL_VERSION}

LABEL maintainer="Klever <riepenmarc@gmail.com>"

ENV TZ=UTC

ARG MY_MYSQL_VERSION
COPY ${MY_MYSQL_VERSION}.my.cnf /etc/my.cnf
