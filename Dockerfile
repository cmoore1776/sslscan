FROM alpine:3.17

ARG VERSION SHA256

RUN \
  apk update && \
  apk add alpine-sdk perl zlib-dev linux-headers curl unzip git && \
  curl -L https://github.com/rbsec/sslscan/archive/refs/heads/master.zip -o sslscan-master.zip  && \
  unzip sslscan-master.zip && \
  cd sslscan-master && \
  make static && make install && \
  cd / && rm -rf sslscan-master && \
  adduser -D -g '' sslscan && \
  apk del alpine-sdk perl zlib-dev linux-headers curl unzip git && \
  rm -rf /var/cache/apk/*

USER sslscan

ENTRYPOINT ["/usr/bin/sslscan"]