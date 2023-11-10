#!/bin/bash

# login
export CR_PAT=$GITHUB_PACKAGE_TOKEN
export VERSION=v0.0.1
# How to get $GITHUB_PACKAGE_TOKEN, go to github.com -> settings -> Developer Settings -> Personal access tokens -> Tokens(classic), generate or get token

echo $CR_PAT | docker login ghcr.io -u $USER --password-stdin

# build
docker build \
    -t ghcr.io/shoppal-ai/runpod-worker-sd-a111:${VERSION} .

docker tag ghcr.io/shoppal-ai/runpod-worker-sd-a111:${VERSION} ghcr.io/shoppal-ai/runpod-worker-sd-a111:latest
# push
docker push ghcr.io/shoppal-ai/runpod-worker-sd-a111:${VERSION}
docker push ghcr.io/shoppal-ai/runpod-worker-sd-a111:latest
