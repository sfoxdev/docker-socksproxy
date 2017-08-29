FROM alpine:edge
MAINTAINER SFoxDev <admin@sfoxdev.com>

ENV DB_HOST_VALUE=mysql \
  DB_PORT_VALUE=3306 \
  DB_USER_VALUE=radius \
  DB_PASS_VALUE=Awdfg3BVd2 \
  DB_NAME_VALUE=radius \
  SECRET=Ptdn64Hsk3

RUN apk update && apk upgrade \
  && apk add --update \
  freeradius freeradius-mysql freeradius-radclient bash mc \
  && rm /var/cache/apk/* \

  # Configure FreeRADIUS
  && set -x \
#  && sed -i "s/allow_vulnerable_openssl.*/allow_vulnerable_openssl = yes/" /etc/raddb/radiusd.conf \
  && sed -i "s/ipaddr = 127.0.0.1/ipaddr = 0.0.0.0\/0/" /etc/raddb/clients.conf \
  && sed -i -e "s/testing123/$SECRET/" /etc/raddb/clients.conf \
#  && sed -i 's/#	read_clients/	readclients/' /etc/raddb/clients.conf \

  && ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql \
  && chmod 777 /var/log/radius/ \
  && chown -R root:radius /etc/raddb \

  && sed -i -e 's@driver =.*@driver = "rlm_sql_mysql"@' \
            -e 's@dialect =.*@dialect = "mysql"@' \
            -e '/read_clients = yes/s@^#@@' \
            -e "s/#	server = \"localhost\"/	server = "$DB_HOST_VALUE"/" \
            -e "s/#	port = 3306/	port = $DB_PORT_VALUE/" \
            -e "s/#	login = \"radius\"/	login = \"$DB_USER_VALUE\"/" \
            -e "s/#	password = \"radpass\"/	password = \"$DB_PASS_VALUE\"/" \
            -e "s/	radius_db = \"radius\"/	radius_db = \"$DB_NAME_VALUE\"/" \
            /etc/raddb/mods-available/sql

VOLUME /etc/raddb

EXPOSE 1812/udp 1813/udp

CMD ["radiusd", "-fl", "stdout"]
