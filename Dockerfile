FROM alpine:3.19.1@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b

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
