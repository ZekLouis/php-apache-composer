# PHP with Composer
FROM php:7.4-apache

LABEL maintainer="Louis Gaume <zeklouis@gmail.com>"

# Updates and install dependencies
RUN apt-get update -y &&\
    apt-get upgrade -y &&\
    apt-get install -y \
    git \
    libzip-dev \
    nano \
    zip &&\
    docker-php-ext-install zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Phalcon Dependencies with Composer
COPY ./000-default.conf /etc/apache2/sites-enabled

# CD to the app dir
WORKDIR /var/www