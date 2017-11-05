FROM pataquets/collectd

ADD *.conf /etc/collectd/conf-available/

RUN \
  cat /etc/collectd/conf-available/read-redis.conf | tee -a /etc/collectd/collectd.conf && \
  nl /etc/collectd/collectd.conf
