FROM alpine:edge
MAINTAINER SFoxDev <admin@sfoxdev.com>

ENV DANTE_VERSION="1.4.2" \
  CFGFILE="/etc/sockd.conf" \
  PIDFILE="/tmp/sockd.pid" \
  WORKERS="1" \
  SECRET="Ptdn64Hsk3"

RUN set -x \
  # Runtime dependencies
  && apk --no-cache add \
    bash mc linux-pam freeradius-pam \
  # Build dependencies
  && apk add --no-cache -t .build-deps \
    linux-pam-dev curl gcc g++ make \
  && mkdir -p /usr/src/dante \
  && cd /usr/src/dante \
  && curl -O http://www.inet.no/dante/files/dante-$DANTE_VERSION.tar.gz \
  && tar xzf dante-$DANTE_VERSION.tar.gz --strip 1 \
  && ac_cv_func_sched_setscheduler=no ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-client \
    --without-libwrap \
    --without-bsdauth \
    --without-gssapi \
    --without-krb5 \
    --without-upnp \
  && make && make install \
  # Add an unprivileged user
  && adduser -S -D -u 8062 -H sockd \

  && mkdir -p /usr/src/pam_radius \
  && cd /usr/src/pam_radius \
  && curl -O ftp://ftp.freeradius.org/pub/radius/pam_radius-1.4.0.tar.gz \
  && tar xzf pam_radius-1.4.0.tar.gz --strip 1 \
  && ./configure \
  && make \
  && cp pam_radius_auth.so /lib/security/ \

  # Clean up
  && cd /usr/src \
  && rm -rf dante pam_radius \
  && ls -la \
  && apk del --purge .build-deps \
  && rm -rf /var/cache/apk/* /tmp/*

ADD conf/ /

RUN sed -i -e "s/SECRET/$SECRET/" /etc/pam_radius_auth.conf \
  && sed -i -e "s/SECRET/$SECRET/" /etc/raddb/server

EXPOSE 1080

CMD sockd -f $CFGFILE -p $PIDFILE -N $WORKERS
