FROM ubuntu:20.04

ENV \
  VERSION=master \
  SHA256=ea202dae87c675b9654f17426725e4989750ad95642e087227e42891d93054c8

RUN apt update && apt upgrade -y && apt install build-essential zlib1g-dev curl unzip git -y && \
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