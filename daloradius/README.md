# DaloRadius

DaloRadius - FreeRadius WebGUI Interface. It uses the MySQL database from FreeRADIUS

[![Docker Build Status](https://img.shields.io/docker/build/sfoxdev/daloradius.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/automated/sfoxdev/daloradius.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/pulls/sfoxdev/daloradius.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/stars/sfoxdev/daloradius.svg?style=flat-square)]()

## Usage

### Run container
```
docker run -d -p 80:80 --name daloradius sfoxdev/daloradius
```
- `SECRET` - FreeRadius secret

### Administrator access

login: administrator

pass: radius

### Notes

MySQL server specific configuration.

```
[mysqld]
sql_mode = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
```
