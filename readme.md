# sslscan

Dockerfile for https://github.com/rbsec/sslscan based on Ubuntu 18.04 and built from source.

## Usage

```bash
docker run --rm -it shamelesscookie/sslscan:latest shameless.gg
Version: 1.11.11-static
OpenSSL 1.0.2-chacha (1.0.2g-dev)

Connected to 35.174.124.83

Testing SSL server shameless.gg on port 443 using SNI name shameless.gg

  TLS Fallback SCSV:
Server supports TLS Fallback SCSV

  TLS renegotiation:
Session renegotiation not supported

  TLS Compression:
Compression disabled

  Heartbleed:
TLS 1.2 not vulnerable to heartbleed
TLS 1.1 not vulnerable to heartbleed
TLS 1.0 not vulnerable to heartbleed

  Supported Server Cipher(s):
Preferred TLSv1.2  128 bits  ECDHE-RSA-AES128-GCM-SHA256   Curve P-256 DHE 256
Accepted  TLSv1.2  128 bits  ECDHE-RSA-AES128-SHA256       Curve P-256 DHE 256
Accepted  TLSv1.2  256 bits  ECDHE-RSA-AES256-GCM-SHA384   Curve P-256 DHE 256
Accepted  TLSv1.2  256 bits  ECDHE-RSA-AES256-SHA384       Curve P-256 DHE 256
Accepted  TLSv1.2  128 bits  AES128-GCM-SHA256            
Accepted  TLSv1.2  128 bits  AES128-SHA256                
Accepted  TLSv1.2  256 bits  AES256-GCM-SHA384            
Accepted  TLSv1.2  256 bits  AES256-SHA256                

  SSL Certificate:
Signature Algorithm: sha256WithRSAEncryption
RSA Key Strength:    2048

Subject:  shameless.gg
Altnames: DNS:shameless.gg, DNS:*.shameless.gg
Issuer:   Amazon

Not valid before: Aug 11 00:00:00 2018 GMT
Not valid after:  Sep 11 12:00:00 2019 GMT
```