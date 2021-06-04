FROM php:7.4.3-apache
RUN a2enmod rewrite \
&& a2ensite 000-default
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
&& apt-get -y update \
&& apt-get install -y libicu-dev gnupg2 unzip git nodejs npm  \
&& docker-php-ext-install intl \
&& docker-php-ext-install pdo \
&& pecl install xdebug
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD apachectl -D FOREGROUND