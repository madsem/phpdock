ARG MY_MYSQL_VERSION
FROM mysql:${MY_MYSQL_VERSION}

LABEL maintainer="Klever <riepenmarc@gmail.com>"

ENV TZ=UTC

ARG ${MY_MYSQL_VERSION}
ENV BUILD_MYSQL if [[ ${MY_MYSQL_VERSION} == *"5.7"* ]]; then 5.7 ; else 8.0 ; fi

COPY ${BUILD_MYSQL}.my.cnf /etc/my.cnf
