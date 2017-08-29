# FreeRadius

FreerRADIUS Server with MySQL storage

[![Docker Build Status](https://img.shields.io/docker/build/sfoxdev/freeradius.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/automated/sfoxdev/freeradius.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/pulls/sfoxdev/freeradius.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/stars/sfoxdev/freeradius.svg?style=flat-square)]()

## Usage

### Run container
```
docker run -d -p 1812/udp:1812/udp -p 1813/udp:1813/udp --name freeradius sfoxdev/freeradius
```
