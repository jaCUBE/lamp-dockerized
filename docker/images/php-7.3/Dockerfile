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
                          git-flow \
                          glances \
                          gnupg2 \
                          htop \
                          imagemagick \
                          lsof \
                          mc \
                          mtr \
                          nano \
                          neofetch \
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
    && apt-get install -y php7.3 \
                          php7.3-cli \
                          php7.3-common \
                          php7.3-curl \
                          php7.3-gd \
                          php7.3-intl \
                          php7.3-json \
                          php7.3-ldap \
                          php7.3-mbstring \
                          php7.3-mysql \
                          php7.3-odbc \
                          php7.3-opcache \
                          php7.3-readline \
                          php7.3-redis \
                          php7.3-sqlite3 \
                          php7.3-xml \
                          php7.3-zip \
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
ENTRYPOINT    bash /docker/scripts/docker_boot.sh \
           && /bin/bash

# Cleanup
RUN    apt-get autoremove \
    && apt-get clean

# Other stuff
EXPOSE 80 443 9000
WORKDIR /var/www/html