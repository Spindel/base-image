#!/usr/bin/env bash

set -eux

REPO_NAME="registry.gitlab.com/modioab/base-image"
PROJECT="zabbix-web"
RELEASE_TAG="$(date +%Y%m%dT%H%M)"

docker build --tag="${REPO_NAME}:${PROJECT}" \
             --tag="${REPO_NAME}:${PROJECT}-${RELEASE_TAG}" \
             --tag="${REPO_NAME}:${PROJECT}-latest" \
             --file Dockerfile .
docker push "${REPO_NAME}:${PROJECT}-latest"
docker push "${REPO_NAME}:${PROJECT}-${RELEASE_TAG}"
