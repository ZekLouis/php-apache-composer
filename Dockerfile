# PHP with Composer
FROM php:8.0-apache

LABEL maintainer="Louis Gaume <zeklouis@gmail.com>"

# Updates and install dependencies
RUN apt-get update -y &&\
    apt-get upgrade -y &&\
    apt-get install -y \
    git \
    libzip-dev \
    nano \
    zip &&\
    docker-php-ext-install zip mysqli pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy apache config file
COPY ./000-default.conf /etc/apache2/sites-enabled

# Enable mod rewrite
RUN a2enmod rewrite

# CD to the app dir
WORKDIR /var/www