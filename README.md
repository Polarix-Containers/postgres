# Postgres

![Build, scan & push](https://github.com/Blue-OCI/postgres/actions/workflows/build.yml/badge.svg)

### Features & usage
- Built on the [Docker Community's Alpine-based image](https://github.com/docker-library/postgres), to be used as a drop-in replacement.
- Unprivileged image: you should check your volumes' permissions (eg `/data`), default UID/GID is 70.
- Removes unnecessary gosu SUID binary.

# Licensing
- The code in this repository is licensed under the Apache License. 😇
- The image is built on `docker.io/postgres`, which is under the MIT license. Copyright belongs to Docker PostgreSQL Authors.
- Any image built by Blue OCI is provided under the combination of license terms resulting from the use of individual packages.
