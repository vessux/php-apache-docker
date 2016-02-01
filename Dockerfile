FROM php:5-apache
RUN apt-get update \
 && apt-get install -y \
    git \
    zlib1g-dev \
    supervisor \
    libpng12-dev \
  && docker-php-ext-install \
    pdo_mysql \
    mbstring \
    bcmath \
    zip \
    gd \
 && docker-php-ext-enable \
    opcache \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
 && curl -L https://phar.phpunit.de/phpunit.phar -o phpunit.phar && chmod +x phpunit.phar && mv phpunit.phar /usr/local/bin/phpunit
