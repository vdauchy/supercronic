FROM alpine as supersonic

ARG VERSION

ENV ARCH=amd64 \
    VERSION=$VERSION \
    OS=linux

RUN apk add --no-cache \
    curl

RUN curl -fsSLO "https://github.com/aptible/supercronic/releases/download/${VERSION}/supercronic-${OS}-${ARCH}" \
    && chmod +x "supercronic-${OS}-${ARCH}" \
    && mv "supercronic-${OS}-${ARCH}" "/usr/bin/supercronic"
