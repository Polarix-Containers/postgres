# Postgres

![Build, scan & push](https://github.com/Blue-OCI/postgres/actions/workflows/build.yml/badge.svg)

### Features & usage
- Built on the [Docker Community's Alpine-based image](https://github.com/docker-library/postgres), to be used as a drop-in replacement.
- Unprivileged image: you should check your volumes' permissions (eg `/data`), default UID/GID is 70.
- Removes unnecessary gosu SUID binary.
