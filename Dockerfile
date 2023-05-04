FROM php:8.1-fpm-alpine

# set the environment variable for PHP
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/php/bin"

RUN apk add --no-cache bash
RUN docker-php-ext-install pdo_mysql

WORKDIR /var/www/html

COPY . .

COPY ./artisan /usr/local/bin/artisan
RUN chmod +x /usr/local/bin/artisan

RUN php artisan key:generate

CMD php artisan serve --host=0.0.0.0 --port=8000
#CMD ["php-fpm"]
