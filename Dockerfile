FROM alpine:3.19

ARG VERSION

RUN \
  apk add --no-cache alpine-sdk coreutils perl zlib-dev linux-headers curl unzip git && \
  git clone --branch ${VERSION} --depth 1 https://github.com/rbsec/sslscan.git && \
  cd sslscan && \
  make static && make install && \
  cd / && rm -rf sslscan && \
  adduser -D -g '' sslscan && \
  apk del alpine-sdk perl zlib-dev linux-headers curl unzip git && \
  rm -rf /var/cache/apk/*

USER sslscan

ENTRYPOINT ["/usr/bin/sslscan"]