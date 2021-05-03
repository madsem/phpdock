#!/usr/bin/env bash

PROJECT_PATH='../../..'

# Move Docker Environment to project root,
# if files or directory exist, rename the old versions.
if [ -f $PROJECT_PATH/.env.phpdock ]; then
    mv $PROJECT_PATH/.env.phpdock $PROJECT_PATH/.env.phpdock.bak
fi

cp src/.env.phpdock $PROJECT_PATH/.env.phpdock

if [ -f $PROJECT_PATH/docker-compose.yml ]; then
    mv $PROJECT_PATH/docker-compose.yml $PROJECT_PATH/docker-compose.yml.bak
fi

cp src/docker-compose.yml $PROJECT_PATH/docker-compose.yml

if [ -f $PROJECT_PATH/phpdock ]; then
    mv $PROJECT_PATH/phpdock $PROJECT_PATH/phpdock.bak
fi

cp src/phpdock $PROJECT_PATH/phpdock

if [ -f $PROJECT_PATH/.dockerignore ]; then
    mv $PROJECT_PATH/.dockerignore $PROJECT_PATH/.dockerignore.bak
fi

cp src/.dockerignore $PROJECT_PATH/.dockerignore

if [ -d $PROJECT_PATH/docker ]; then
    mv $PROJECT_PATH/docker $PROJECT_PATH/docker-bak
fi

cp -rf src/docker $PROJECT_PATH/docker
