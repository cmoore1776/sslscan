FROM alpine:3.16

ARG VERSION SHA256

RUN \
  apk update && \
  apk add alpine-sdk perl zlib-dev linux-headers curl gzip git && \
  curl -L https://github.com/rbsec/sslscan/archive/refs/tags/${VERSION}.tar.gz -o sslscan-${VERSION}.tar.gz  && \
  sha256sum sslscan-${VERSION}.tar.gz | grep ${SHA256} && \
  tar -xzf sslscan-${VERSION}.tar.gz && \
  cd sslscan-${VERSION} && \
  make static && make install && \
  cd / && rm -rf sslscan-${VERSION} && \
  adduser -D -g '' sslscan && \
  apk del alpine-sdk perl zlib-dev linux-headers curl gzip git && \
  rm -rf /var/cache/apk/*

USER sslscan

ENTRYPOINT ["/usr/bin/sslscan"]