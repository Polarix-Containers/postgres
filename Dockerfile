ARG VERSION=16

FROM postgres:${VERSION}-alpine

LABEL maintainer="Thien Tran contact@tommytran.io"

RUN apk -U upgrade \
    && apk add libstdc++ \
    && rm -rf /var/cache/apk/*

COPY --from=ghcr.io/polarix-containers/hardened_malloc:latest /install /usr/local/lib/

RUN rm /usr/local/bin/gosu /usr/local/bin/su-exec

USER postgres

ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"