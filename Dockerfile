FROM pataquets/collectd

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install libhiredis0.13 \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD *.conf /etc/collectd/conf-available/

RUN \
  cat /etc/collectd/conf-available/read-redis.conf | tee -a /etc/collectd/collectd.conf && \
  nl /etc/collectd/collectd.conf
