FROM debian:buster-slim

ENV \
  VERSION=master \
  SHA256=6aaf0572db0b263f510364801be73ed89c3397c7d176e0055e7690d40bfbfb61

RUN \
    echo "deb-src http://deb.debian.org/debian/ buster main" >> /etc/apt/sources.list && \
    echo "deb-src http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    echo "deb-src http://deb.debian.org/debian/ buster-updates main" >> /etc/apt/sources.list && \
    apt update && apt upgrade -y && apt install build-essential zlib1g-dev curl unzip git -y && \
    apt build-dep -y openssl && \
    curl -L https://github.com/rbsec/sslscan/archive/master.zip -o sslscan-${VERSION}.zip  && \
    sha256sum sslscan-${VERSION}.zip | grep ${SHA256} && \
    unzip sslscan-${VERSION}.zip && \
    cd sslscan-${VERSION} && \
    make static && make install && \
    cd / && rm -rf sslscan-${VERSION} && \
    apt remove build-essential zlib1g-dev curl unzip git -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/sslscan"]