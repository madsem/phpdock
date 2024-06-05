#!/bin/bash

sed -i "s/{{DB_NAME}}/$DB_NAME/g; s/{{DB_USER}}/$DB_USER/g; s/{{DB_PASS}}/$DB_PASS/g" /docker-entrypoint-initdb.d/init.sql
