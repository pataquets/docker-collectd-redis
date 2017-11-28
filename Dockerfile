FROM pataquets/collectd

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install libhiredis0.13 \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY *.conf /etc/collectd/conf-available/

RUN \
  ln -vs /etc/collectd/conf-available/read-redis.conf \
    /etc/collectd/conf.d/ \
  && \
  nl \
    /etc/collectd/collectd.conf \
    /etc/collectd/conf.d/*
