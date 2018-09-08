FROM ubuntu:18.04

ENV \
  VERSION=1.11.11-rbsec \
  SHA256=6b4b96eff6812b8181e95d841dee13a9b91c78697f74bcad4941b73779843621

RUN apt-get update && apt install build-essential zlib1g-dev curl unzip git -y && \
    curl -L https://github.com/rbsec/sslscan/archive/${VERSION}.zip -o sslscan-${VERSION}.zip  && \
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