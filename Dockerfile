FROM alpine:3.14

ENV \
  VERSION=master \
  SHA256=b603824433404769e8ebe39749f6b160fe1a0614d23dc19e0fdce6847610b1e6

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