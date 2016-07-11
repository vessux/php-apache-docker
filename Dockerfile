FROM php:7-apache
RUN apt-get update \
 && apt-get install -y \
    git \
    zlib1g-dev \
    supervisor \
    libpng12-dev \
    libjpeg62-turbo \
    libjpeg-dev \
 && docker-php-ext-install \
    pdo_mysql \
    mbstring \
    bcmath \
    zip \
 && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib \
 && docker-php-ext-install \
    gd \
    exif \
 && docker-php-ext-enable \
    opcache \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
 && curl -L https://phar.phpunit.de/phpunit.phar -o phpunit.phar && chmod +x phpunit.phar && mv phpunit.phar /usr/local/bin/phpunit
