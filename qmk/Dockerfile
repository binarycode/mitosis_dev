FROM debian:stretch
MAINTAINER Igor Sidorov <igor.sidorov@binarycode.ru>

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      avr-libc \
      avrdude \
      binutils-avr \
      build-essential \
      gcc-avr \
    && rm -rf /var/lib/apt/lists/*

VOLUME /qmk
WORKDIR /qmk
