FROM alpine:3.18.0@sha256:02bb6f428431fbc2809c5d1b41eab5a68350194fb508869a33cb1af4444c9b11

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
