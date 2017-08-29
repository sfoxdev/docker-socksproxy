#!/bin/sh

chmod a+rw /proc/self/fd/0
chmod a+rw /proc/self/fd/1
chmod a+rw /proc/self/fd/2

sed -i -e "s/host_temp/$DB_HOST_VALUE/" \
 -e "s/port_temp/$DB_PORT_VALUE/" \
 -e "s/user_temp/$DB_USER_VALUE/" \
 -e "s/pass_temp/$DB_PASS_VALUE/" \
 -e "s/name_temp/$DB_NAME_VALUE/" \
 /var/www/html/library/daloradius.conf.php
