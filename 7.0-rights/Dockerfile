FROM php:7.0.22-apache

ENV USER_ID="33" USER_NAME="www-data" GROUP_ID="33" GROUP_NAME="www-data"

COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

COPY ./entrypoint /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/local-devel-entrypoint"]
CMD ["apache2-foreground"]
