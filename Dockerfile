FROM ubuntu:18.04

ENV \
  VERSION=master \
  SHA256=9a49aaf5ae51ed14a1dc27f12ad390d68e27ea17ca04c4921739f7827625f6bc

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