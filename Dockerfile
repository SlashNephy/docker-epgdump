FROM alpine:3.23.0@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375

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
