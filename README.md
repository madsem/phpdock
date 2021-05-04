# phpDock

Based on Alpine Linux.  
Made for a simple macOS php dev environment.

Including:
- MySql Server: 5.7, 8.0, latest - [default: 8.0]
- PHP-FPM: any valid fpm alpine tag - [default: 8.0.5-fpm-alpine3.13]
- Redis: any valid alpine tag - [default: 5.0.12-alpine]
- Nginx: 1.20.0-alpine
- Node: 15.14-alpine
- MailHog: latest
- Composer 2
- node, npm, yarn

# Docker Config

Docker environment can be configured in `.env.phpdock`.  
Easily swap out images and configure docker env separate from your application `.env`.

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
 
#fish
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

For more commands, check out the `phpdock` executable in your project root.

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