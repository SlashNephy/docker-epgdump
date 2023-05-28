FROM alpine:3.17.3@sha256:124c7d2707904eea7431fffe91522a01e5a861a624ee31d03372cc1d138a3126

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
