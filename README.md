# Postgres

![Build, scan & push](https://github.com/Blue-OCI/postgres/actions/workflows/build.yml/badge.svg)

### Features & usage
- Built on the [Docker Community's Alpine-based image](https://github.com/docker-library/postgres), to be used as a drop-in replacement.
- Unprivileged image: you should check your volumes' permissions (eg `/data`), default UID/GID is 70.
- Removes unnecessary gosu SUID binary.

### Sample Docker Compose config

```
  postgres:
    container_name: postgres
    image: ghcr.io/blue-oci/postgres:16
    restart: unless-stopped
    volumes:
      - postgres:/var/lib/postgresql/data:Z
    environment:
      - POSTGRES_USER=postgres_user
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres_user"]
      interval: 15s
      timeout: 5s
    user: "70:70"
    read_only: true
    tmpfs:
      - /var/run/postgresql:size=50M,mode=0770,uid=70,gid=70,noexec,nosuid,nodev
    security_opt:
      - "no-new-privileges=true"
    cap_drop:
      - ALL
```

### Licensing
- The code in this repository is licensed under the Apache License. 😇
- The image is built on `docker.io/postgres`, which is under the MIT license. Copyright to the base image belongs to Docker PostgreSQL Authors.
- Any image built by Blue OCI is provided under the combination of license terms resulting from the use of individual packages.
