from ubuntu:14.04

MAINTAINER Nilesh A. <nileshadiyecha@gmail.com>

RUN apt-get update && apt-get install -y \
    vim \
    curl \
    rsync \
    git \
    mysql-client-5.6 \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && apt-get install -y supervisor \
    && apt-get install -y software-properties-common \
    && locale-gen en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && apt-get -y update \
    && apt-get install -y apache2 \
    && a2enmod rewrite \
    && sudo add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y libapache2-mod-php7.0 php7.0 php7.0-mysql \
    && apt-get install -y php7.0-common php7.0-gd php7.0-mysql php7.0-mcrypt php7.0-curl php7.0-intl php7.0-xsl \
    && apt-get install -y php7.0-mbstring php7.0-zip php7.0-bcmath php7.0-iconv \
    && apt-get install -y apt-transport-https \
    && wget https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-english.tar.gz \
    && tar xvzf phpMyAdmin-4.6.4-english.tar.gz \
    && mv phpMyAdmin-4.6.4-english phpmyadmin \
    && rm -rf phpMyAdmin-4.6.4-english.tar.gz \
    && chown -R www-data:www-data phpmyadmin \
    && cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php \
    && sed -i 's/localhost/db/' phpmyadmin/config.inc.php \
    && apt-get -y install cron \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer -V

ADD tools/docker/phpmyadmin/config.inc.php /phpmyadmin/config.inc.php

ADD tools/docker/apache2/ports.conf /etc/apache2/ports.conf
ADD tools/docker/apache2/000-default.conf /etc/apache2/sites-enabled/000-default.conf

ADD tools/docker/php7/apache2/php.ini /etc/php/7.0/apache2/php.ini
ADD tools/docker/php7/cli/php.ini /etc/php/7.0/cli/php.ini
ADD tools/docker/supervisor/supervisord.conf /etc/supervisor/
ADD tools/docker/supervisor/conf.d/apps.conf /etc/supervisor/conf.d/apps.conf
ADD tools/docker/scripts/entrypoint.sh /entrypoint.sh
ADD tools/docker/scripts/start.sh start.sh

RUN chmod +x entrypoint.sh

EXPOSE 22 80 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash", "/start.sh"]
