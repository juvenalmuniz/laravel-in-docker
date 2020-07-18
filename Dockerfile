FROM php:7.4-fpm-alpine

RUN set -ex && apk --no-cache add postgresql-dev libpng-dev libjpeg-turbo-dev freetype-dev libzip-dev

RUN docker-php-ext-install pdo pdo_pgsql bcmath ctype fileinfo tokenizer exif

RUN docker-php-ext-configure gd --with-gd --with-jpeg-dir \
    --with-png-dir --with-zlib-dir --with-freetype-dir

RUN docker-php-ext-install gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer