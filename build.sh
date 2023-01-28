#!/usr/bin/env bash

# build and push the image

NAME="rittelle/nebula-lighthouse"
VERSION="1.6.1"
ARCHITECTURES="linux/amd64,linux/arm64"

docker buildx build \
    --platform "$ARCHITECTURES" \
    --build-arg "version=$VERSION" \
    -t "$NAME:$VERSION" \
    -t "$NAME:latest" \
    --push \
    .
