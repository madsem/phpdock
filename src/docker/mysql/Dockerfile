ARG MY_MYSQL_VERSION
FROM mysql:${MY_MYSQL_VERSION}

LABEL maintainer="Klever <riepenmarc@gmail.com>"

ENV TZ=UTC

ARG ${MY_MYSQL_VERSION}
RUN if [[ ${MY_MYSQL_VERSION} == *"5.7"* ]]; then MYSQL_VERSION=5.7 ; else MYSQL_VERSION=8.0 ; fi

COPY ${MYSQL_VERSION}.my.cnf /etc/my.cnf
