#!/usr/bin/env bash

set -eux

NAME=python
PACKAGES="python3"
REPO_NAME="registry.gitlab.com/modioab/base-image:$(lsb_release -is|tr A-Z a-z)-$(lsb_release -rs)-${NAME}"
RELEASE_TAG="-$(date +%Y%m%d)"

TMPDIR=$(mktemp -d supermin-docker.XXXXX)
#trap "sudo rm -rf $TMPDIR" EXIT

SUPERMIN_APPLIANCE="${TMPDIR}/${NAME}.o"
DOCKER_CONTEXT="${TMPDIR}/${NAME}.docker"

supermin --prepare ${PACKAGES} -o "${SUPERMIN_APPLIANCE}"
# Exclude Python 2 mystery files
cat > "${SUPERMIN_APPLIANCE}/excludefiles" <<EOF
-/usr/bin/easy_install-2.7
-/usr/bin/python2
-/usr/bin/python2.7
-/usr/bin/pip2
-/usr/bin/pip2.7
-/usr/lib/python2.7
-/usr/lib/python2.7/*
-/usr/lib64/python2.7
-/usr/lib64/python2.7/*
EOF

supermin --build --format chroot "${SUPERMIN_APPLIANCE}" -o "${DOCKER_CONTEXT}" --include-packagelist

cat > "${DOCKER_CONTEXT}/Dockerfile" <<EOF
FROM scratch
COPY . /
RUN ln -f -s python3 /usr/bin/python
EOF
docker build --tag="${REPO_NAME}" --tag="${REPO_NAME}${RELEASE_TAG}" "${DOCKER_CONTEXT}"
docker push "${REPO_NAME}"
docker push "${REPO_NAME}${RELEASE_TAG}"
