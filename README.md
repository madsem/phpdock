# phpDock

Docker Compose environment, based on Alpine Linux.  

Made to be a very fast & simple macOS php development environment.  
Spin up a new environment in `<= 10 seconds`  (after you have the base images downloaded)

Including:  
`php-fpm`, `MySql`, `Redis`, `Nginx`, `Mailhog`, `Composer`, `node`, `npm` & `yarn`


# Docker Config

Docker environment can be configured in `.env.phpdock`.  
Easily swap out images and configure docker separate from your application `.env`.

Use any of these in `.env.phpdock`, to customize your environment:
- PHP-fpm: 7.4-latest, 8.0-latest
- MySql Server: any valid mysql tag between 5.7 - 8.x
- Redis: any valid alpine tag

To customize more, you can always edit the `docker-compose,yml`.

# Install
```shell
composer require madsem/phpdock --dev
```
Then run `vendor/bin/phpdock publish`, to publish the `docker/` folder and phpdock files into your project directory.

Then you can start using the executable shell script like so:
```
vendor/bin/phpdock <command>
```

### Create an Alias
```shell
# bash
alias phpdock="./vendor/bin/phpdock"
 
# fish
alias phpdock "./vendor/bin/phpdock"
 ```

 ### Start a new Project
 ```shell
 phpdock build
 ```
 This will build the containers for your project.

 After the containers are ready, run `phpdock up` to start the containers.

 Then you can log into the `app`, `nginx`, `mysql` or `redis` services as follows:
 ```shell
 phpdock ssh <service name>
 ```

To shut down but not destroy your work, run `phpdock down`,  
or to destroy the containers, images and associated volumes `phpdock destroy`.

To rebuild containers after config changes, run `phpdock rebuild`:
```shell
# rebuild everything
phpdock rebuild
phpdock rebuild all

# rebuild only a particular service
phpdock rebuild app
phpdock rebuild web
```

### Update phpDock
```shell
composer update madsem/phpdock
phpdock update
```
This will publish the new phpdock files, and append `.bak` to old files & the `docker` directory.

For more commands, run `phpdock help`.

## Example For a Laravel Project
Laravel env file using the phpdock default configuration:
```env
# Project ENV
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=phpdock
DB_USERNAME=phpdock
DB_PASSWORD=secret

REDIS_HOST=redis
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_DRIVER=redis

MAIL_HOST=mail
MAIL_PORT=1025
```


# Database Manager
Connect to DB Management software like TablePlus, like this:  
![table plus config](/docs/tableplus.png)


# phpDock Base Image Extensions Included:
```shell
[PHP Modules]
bcmath
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
grpc
hash
iconv
imagick
intl
json
libxml
maxminddb
mbstring
mysqlnd
openssl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
protobuf
readline
redis
Reflection
session
SimpleXML
soap
sodium
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
zip
zlib
```

### Install Custom PHP Extensions:
phpDock uses https://github.com/mlocati/docker-php-extension-installer#supported-php-extensions
to install extensions.

This package detects your PHP version and installs the correct version.
Simply add additional extensions or modifications to the `docker/app/Dockerfile`, like this:
```shell
RUN install-php-extensions \
  csv \
  ... \
  ...
```


# Hat Tips :shipit:	
- Chris Fidao && [Vessel](https://github.com/shipping-docker/vessel)
- Yuki Imamura && [Docker Laravel](https://github.com/ucan-lab/docker-laravel)