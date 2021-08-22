FROM alpine:3.14

ENV \
  VERSION=master \
  SHA256=a9062ac487a58d821201b1869e9e83a9224e50b8c6daac3c452b452aecfe7b9a

RUN \
  apk update && apk add alpine-sdk perl zlib-dev linux-headers curl unzip git && \
  curl -L https://github.com/rbsec/sslscan/archive/master.zip -o sslscan-${VERSION}.zip  && \
  sha256sum sslscan-${VERSION}.zip | grep ${SHA256} && \
  unzip sslscan-${VERSION}.zip && \
  cd sslscan-${VERSION} && \
  make static && make install && \
  cd / && rm -rf sslscan-${VERSION} && \
  adduser -D -g '' sslscan && \
  apk del alpine-sdk perl zlib-dev linux-headers curl unzip git && \
  rm -rf /var/cache/apk/*

USER sslscan

ENTRYPOINT ["/usr/bin/sslscan"]