#!/usr/bin/env bash

set -eux

source /etc/os-release
OUTPUT="$(pwd)/rootfs.tar"

NAME=python
PACKAGES="python3 python3-pycurl python3-cryptography python3-pyOpenSSL python3-zope-interface python3-CacheControl"
REPO_NAME="registry.gitlab.com/modioab/base-image:${ID}-${VERSION_ID}-${NAME}"
RELEASE_TAG="-$(date +%Y%m%dT%H%M)"

TMPDIR=$(mktemp -d supermin-docker.XXXXX)
trap "chmod -R u+w $TMPDIR; rm -rf $TMPDIR" EXIT

SUPERMIN_APPLIANCE="${TMPDIR}/${NAME}.o"
DOCKER_CONTEXT="${TMPDIR}/${NAME}.docker"

dnf install -y ${PACKAGES}
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
pushd ${DOCKER_CONTEXT}
tar cf ${OUTPUT} .
popd
