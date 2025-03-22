FROM internetsystemsconsortium/bind9:9.21 AS base

RUN apt-get update \
  && apt-get install -y dnsutils \
  && apt-get clean

HEALTHCHECK --timeout=1s --interval=10s --retries=0 --start-period=30s \
  CMD dig +norecurse +short +retry=0 @127.0.0.1 localhost || exit 1
