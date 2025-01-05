ARG VERSION=17
ARG UID=200012
ARG GID=200012

FROM postgres:${VERSION}-alpine
ARG UID
ARG GID

LABEL maintainer="Thien Tran contact@tommytran.io"

RUN apk -U upgrade \
    && apk add libstdc++ shadow \
    && rm /usr/local/bin/gosu

RUN --network=none \
    usermod -u ${UID} postgres \
    && groupmod -g ${GID} postgres \
    && find / -user 70 -exec chown -h postgres {} \; \
    && find / -group 70 -exec chgrp -h postgres {} \; \
    && apk del shadow \
    && rm -rf /var/cache/apk/*

COPY --from=ghcr.io/polarix-containers/hardened_malloc:latest /install /usr/local/lib/
ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"

USER postgres
