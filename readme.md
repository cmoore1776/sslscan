# sslscan

[sslscan](https://github.com/rbsec/sslscan) running on Alpine Linux and built from source.

## Usage

```bash
$ docker run --rm -it cmoore1776/sslscan:latest christianmoore.me
Version: 2.1.5-static
OpenSSL 3.0.15 3 Sep 2024

Connected to 13.249.190.56

Testing SSL server christianmoore.me on port 443 using SNI name christianmoore.me

  SSL/TLS Protocols:
SSLv2     disabled
SSLv3     disabled
TLSv1.0   disabled
TLSv1.1   disabled
TLSv1.2   enabled
TLSv1.3   enabled

  TLS Fallback SCSV:
Server supports TLS Fallback SCSV

  TLS renegotiation:
Session renegotiation not supported

  TLS Compression:
Compression disabled

  Heartbleed:
TLSv1.3 not vulnerable to heartbleed
TLSv1.2 not vulnerable to heartbleed

  Supported Server Cipher(s):
Preferred TLSv1.3  128 bits  TLS_AES_128_GCM_SHA256        Curve 25519 DHE 253
Accepted  TLSv1.3  256 bits  TLS_AES_256_GCM_SHA384        Curve 25519 DHE 253
Accepted  TLSv1.3  256 bits  TLS_CHACHA20_POLY1305_SHA256  Curve 25519 DHE 253
Preferred TLSv1.2  128 bits  ECDHE-RSA-AES128-GCM-SHA256   Curve 25519 DHE 253
Accepted  TLSv1.2  256 bits  ECDHE-RSA-AES256-GCM-SHA384   Curve 25519 DHE 253
Accepted  TLSv1.2  256 bits  ECDHE-RSA-CHACHA20-POLY1305   Curve 25519 DHE 253

  Server Key Exchange Group(s):
TLSv1.3  128 bits  secp256r1 (NIST P-256)
TLSv1.3  192 bits  secp384r1 (NIST P-384)
TLSv1.3  128 bits  x25519
TLSv1.2  128 bits  secp256r1 (NIST P-256)
TLSv1.2  192 bits  secp384r1 (NIST P-384)
TLSv1.2  128 bits  x25519

  SSL Certificate:
Signature Algorithm: sha256WithRSAEncryption
RSA Key Strength:    2048

Subject:  christianmoore.me
Altnames: DNS:christianmoore.me
Issuer:   Amazon RSA 2048 M01

Not valid before: Aug 23 00:00:00 2023 GMT
Not valid after:  Sep 20 23:59:59 2024 GMT
```

## build

```bash
export VERSION=2.1.5
docker buildx build --build-arg VERSION --no-cache --platform linux/amd64,linux/arm64 -t cmoore1776/sslscan:${VERSION} -t cmoore1776/sslscan:latest --pull --push .
```
