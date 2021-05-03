# phpDock

Based on Alpine Linux.
Made for my macOS dev environment.
Make it your own by forking it, or not and live dangerously! :)

Including:
- MySql Server: 5.7, 8.0, latest - [default: 8.0]
- PHP-FPM: any valid fpm alpine tag - [default: 8.0.5-fpm-alpine3.13]
- Redis: any valid alpine tag - [default: 5.0.12-alpine]
- Nginx: 1.20.0-alpine
- Node: 15.14-alpine
- MailHog: latest

# Docker Config

Docker environment can be configured in `./.env.phpdock`
Easily swap out images and configure docker env separate from your application `.env`.

# Install
```shell
# run from your project dir
composer require madsem/phpdock --dev
```
This will publish the `docker/` folder and phpdock files into your project directory.

Then you can start using the executable shell script like so:
```
./phpdock <command>
```
 
 ### Start a new Project
 ```shell
 ./phpdock build
 ```
 This will build the containers for your project.

 After the containers are ready, run `./phpdock up` to start the containers.

 Then you can log into the `app`, `nginx`, `mysql` or `redis` services as follows:
 ```shell
 ./phpdock ssh <service name>
 ```

To shut down but not destroy your work, run `./phpdock down`,
or to destroy the containers, images and associated volumes `./phpdock kill`.

For more commands, check out the `src/phpdock` executable.

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


# PHP Extensions Installed by Default
```shell
bcmath
Core
ctype
curl
date
dom
fileinfo
filter
ftp
hash
iconv
intl
json
libxml
mbstring
mysqlnd
openssl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
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
phpDock uses https://github.com/mlocati/docker-php-extension-installer/ to install extensions.
This package detects your PHP version and installs the correct version.
Simply add additional extensions to the `docker/app/Dockerfile`, like this:
```shell
install-php-extensions redis \
  pdo_mysql \
  zip \
  intl \
  bcmath \
  ... \
  ...
```


# Hat Tips :shipit:	
- Chris Fidao && [Vessel](https://github.com/shipping-docker/vessel)
- Yuki Imamura && [Docker Laravel](https://github.com/ucan-lab/docker-laravel)