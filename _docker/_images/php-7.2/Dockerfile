FROM debian:stretch-slim

LABEL maintainer="Jakub Rychecký <jakub@rychecky.cz>" \
      description="PHP 7.2 with Apache"

ENV BUILD_DATE 2018-10-01





# -- BASIC LINUX TOOLS AND DEPENDENCIES --
RUN    apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
                          apt-transport-https \
                          ca-certificates \
                          curl \
                          discus \
                          dstat \
                          ftp \
                          git \
                          glances \
                          gnupg2 \
                          htop \
                          lsof \
                          mc \
                          mtr \
                          nano \
                          nmap \
                          tcpdump \
                          telnet \
                          vim \
                          wget


# -- PHP INSTALLATION --
RUN    wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get upgrade -y \
    # Installs PHP 7.2 and its extensions
    && apt-get install -y php7.2 \
                          php7.2-cli \
                          php7.2-common \
                          php7.2-curl \
                          php7.2-gd \
                          php7.2-intl \
                          php7.2-json \
                          php7.2-ldap \
                          php7.2-mbstring \
                          php7.2-mysql \
                          php7.2-odbc \
                          php7.2-opcache \
                          php7.2-readline \
                          php7.2-redis \
                          php7.2-sqlite3 \
                          php7.2-xml \
                          php7.2-zip \
                          php-xdebug


# -- APACHE INSTALLATION AND CONFIGURATION --
RUN    apt-get install -y apache2 \
    && a2enmod rewrite \
    && echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf \
    && a2enconf servername
CMD ln -sf /dev/stdout //var/log/apache2access.log


# -- COMPOSER INSTALLATION --
RUN    php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer


# -- NODEJS INSTALLATION --
RUN    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh \
    && bash nodesource_setup.sh \
    && apt-get install -y nodejs

# -- BASIC NPM GLOBAL STUFF --
RUN npm i gulp \
          webpack \
          webpack-cli \
          yarn -g




# -- CONFIGURATION AND FINISHING --
# PHP config
COPY 40-custom-php.ini /etc/php/7.2/apache2/conf.d/40-custom-php.ini
COPY 50-xdebug.ini /etc/php/7.2/apache2/conf.d/50-xdebug.ini

# Timezone settings
RUN    unlink /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime

# -- FINISHING --
# Apache autostart and mod_rewrite enable
ENTRYPOINT    service apache2 start \
           && /bin/bash

# Cleanup
RUN    apt-get autoremove \
    && apt-get clean

# Other stuff
EXPOSE 80 443 9000
WORKDIR /var/www/html