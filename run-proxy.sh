#!/usr/bin/env bash

COOKIE_SECRET="$(dd if=/dev/urandom bs=32 count=1 2>/dev/null | base64 | tr -d -- '\n' | tr -- '+/' '-_')"

docker run --rm --name=oauth2-proxy \
  --net=host \
  -v $(pwd)/oauth2-proxy.cfg:/etc/oauth2-proxy.cfg \
  quay.io/oauth2-proxy/oauth2-proxy \
  --config=/etc/oauth2-proxy.cfg \
  --client-id="${GITHUB_OAUTH_CLIENT_ID}" \
  --client-secret="${GITHUB_OAUTH_SECRET}" \
  --cookie-secret="${COOKIE_SECRET}"
