FROM php:7.0-apache
MAINTAINER SFoxDev <admin@sfoxdev.com>

ENV DB_HOST_VALUE=mysql \
  DB_PORT_VALUE=3306 \
  DB_USER_VALUE=radius \
  DB_PASS_VALUE=Awdfg3BVd2 \
  DB_NAME_VALUE=radius

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        mc \
        git \
  && docker-php-ext-install mysqli \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && pear install DB-1.8.0 mail \
  && mkdir -p /src/daloradius \
  && git clone https://github.com/lirantal/daloradius.git /var/www/html

ADD conf/ /

RUN chmod a+rw /proc/self/fd/0 \
  && chmod a+rw /proc/self/fd/1 \
  && chmod a+rw /proc/self/fd/2 \

  && sed -i -e "s/host_temp/$DB_HOST_VALUE/" \
            -e "s/port_temp/$DB_PORT_VALUE/" \
            -e "s/user_temp/$DB_USER_VALUE/" \
            -e "s/pass_temp/$DB_PASS_VALUE/" \
            -e "s/name_temp/$DB_NAME_VALUE/" \
            /var/www/html/library/daloradius.conf.php \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 443

WORKDIR /var/www/html

CMD apachectl -D FOREGROUND
