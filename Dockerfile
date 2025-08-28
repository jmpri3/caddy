# syntax=docker/dockerfile:1
FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/digitalocean \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM caddy:2.10.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
