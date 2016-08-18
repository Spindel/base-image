#!/usr/bin/env bash
set -eux
source /etc/os-release

NAME=python
PACKAGES="python3"
REPO_NAME="registry.gitlab.com/modioab/base-image:${ID}-${VERSION_ID}-${NAME}"
RELEASE_TAG="-$(date +%Y%m%dT%H%M)"

docker push "${REPO_NAME}-latest"
docker push "${REPO_NAME}${RELEASE_TAG}"
