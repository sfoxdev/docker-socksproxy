# Dante - A free SOCKS server with authentication

Dante is a product developed by Inferno Nettverk A/S. It consists of a
SOCKS server and a SOCKS client, implementing RFC 1928 and related standards.
It is a flexible product that can be used to provide convenient and secure
network connectivity.

[![Docker Build Status](https://img.shields.io/docker/build/sfoxdev/dante.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/automated/sfoxdev/dante.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/pulls/sfoxdev/dante.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/stars/sfoxdev/dante.svg?style=flat-square)]()

## Usage

### Run container
```
docker run -d -e SECRET=Ptdn64Hsk3 -p 1080:1080 --name dante sfoxdev/dante
```
- `SECRET` - FreeRadius secret

### Test user in DB

login: test

pass: test1234
