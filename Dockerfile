FROM scratch

MAINTAINER Pascal Nitsche

ADD rootfs.tar.gz /

RUN set -ex \
    && apk add --no-cache \
      alpine-baselayout \
      alpine-keys \
      apk-tools \
      libc-utils \
    && rm -rf /var/cache/apk/* /tmp/*
