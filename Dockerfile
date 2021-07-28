FROM alpine as supersonic

ARG VERSION
ARG ARCH

RUN apk add --no-cache curl

RUN curl -fsSLO "https://github.com/aptible/supercronic/releases/download/${VERSION}/supercronic-linux-${ARCH}" \
    && chmod +x "supercronic-linux-${ARCH}" \
    && mv "supercronic-linux-${ARCH}" "/usr/bin/supercronic"

FROM scratch

COPY --from=supersonic /usr/bin/supercronic /

CMD ["/supercronic"]