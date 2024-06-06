#!/usr/bin/env sh

set -e
set -u
set -o pipefail

url="root:${DB_PASS}@singlestore:9000/api/v1/query/rows"
header="content-type: application/json"


curl -s -XPOST -H "$header" -d "{ \"sql\": \"CREATE DATABASE IF NOT EXISTS ${DB_NAME};\" }" $url
curl -s -XPOST -H "$header" -d "{ \"sql\": \"CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';\" }" $url
curl -s -XPOST -H "$header" -d "{ \"sql\": \"GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';\" }" $url
curl -s -XPOST -H "$header" -d "{ \"sql\": \"FLUSH PRIVILEGES;\" }" $url

echo "Done"
