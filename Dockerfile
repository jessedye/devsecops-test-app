#install composer
FROM composer:1.9.3 as vendor

WORKDIR /tmp/

COPY composer.json composer.json
COPY composer.lock composer.lock

RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

# Use the official PHP 8.0 image as the base
FROM php:8.0-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set the document root to Laravel's public directory
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Copy the application files to the container
COPY src/ /var/www/html

#copy vendor file
COPY --from=vendor /tmp/vendor/ /var/www/html/vendor/

# Set the working directory
WORKDIR /var/www/html
