#!/usr/bin/env bash

# See endpoints - https://oauth2-proxy.github.io/oauth2-proxy/features/endpoints

curl localhost:4180/ping ; echo

curl localhost:4180/oauth2/userinfo
