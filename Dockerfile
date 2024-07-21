ARG VERSION=16

FROM postgres:${VERSION}-alpine

LABEL maintainer="Thien Tran contact@tommytran.io"

RUN apk -U upgrade \
    && apk add libstdc++ \
    && rm -rf /var/cache/apk/*

COPY --from=ghcr.io/blue-oci/hardened_malloc:latest /extract /usr/local/lib/

RUN rm /usr/local/bin/gosu /usr/local/bin/su-exec

RUN chown -R postgres:postgres /var/lib/postgresql/data

USER postgres

ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"
