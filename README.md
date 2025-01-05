# Postgres

![Build, scan & push](https://github.com/Polarix-Containers/postgres/actions/workflows/build-17.yml/badge.svg)
![Build, scan & push](https://github.com/Polarix-Containers/postgres/actions/workflows/build-16.yml/badge.svg)
![Build, scan & push](https://github.com/Polarix-Containers/postgres/actions/workflows/build-15.yml/badge.svg)
![Build, scan & push](https://github.com/Polarix-Containers/postgres/actions/workflows/build-14.yml/badge.svg)
![Build, scan & push](https://github.com/Polarix-Containers/postgres/actions/workflows/build-13.yml/badge.svg)

### Features & usage
- Built on the [Docker Community's Alpine-based image](https://github.com/docker-library/postgres), to be used as a drop-in replacement.
- Unprivileged image: you should check your volumes' permissions (eg `/var/lib/postgresql/data`), default UID/GID is 70.
- Removes unnecessary gosu SUID binary.

### Sample Docker Compose config

```
  postgres:
    container_name: postgres
    image: ghcr.io/polarix-containers/postgres:17
    restart: unless-stopped
    volumes:
      - ./postgres:/var/lib/postgresql/data:Z
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres_user"]
      interval: 15s
      timeout: 5s
    user: "200012:200012"
    read_only: true
    tmpfs:
      - /var/run/postgresql:size=50M,mode=0770,uid=200012,gid=200012,noexec,nosuid,nodev
    security_opt:
      - "no-new-privileges=true"
    cap_drop:
      - ALL
```

### Licensing
- The code in this repository is licensed under the Apache license. 😇
- The image is built on `docker.io/postgres`, which is under the MIT license. Copyright to the base image belongs to Docker PostgreSQL Authors.
- Any image built by Polarix Containers is provided under the combination of license terms resulting from the use of individual packages.
