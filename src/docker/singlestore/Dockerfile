FROM ghcr.io/singlestore-labs/singlestoredb-dev:latest

# Ensure we are in the right directory
WORKDIR /docker-entrypoint-initdb.d

# Copy the init.sql file to the appropriate directory
COPY init.sql /docker-entrypoint-initdb.d/init.sql

# Copy the replace_env_vars.sh script to the appropriate directory
COPY replace_env_vars.sh /usr/local/bin/replace_env_vars.sh

USER root

# Set correct permissions for the script
RUN chmod +x /usr/local/bin/replace_env_vars.sh
