FROM alpine:3.18.2@sha256:830b767f06c8333bc3590165546622cdc9c1780329b78f142cb824957c04d93e

RUN apk add --update --no-cache --virtual .build-deps \
        build-base \
        cmake \
        git \
    # Build
    && git clone https://github.com/Piro77/epgdump /app \
    && cd /app \
    && cmake . \
    && make \
    && make install \
    \
    # Clean
    && apk del --purge .build-deps \
    && rm -rf /app

ENTRYPOINT [ "/usr/local/bin/epgdump" ]
