#!/usr/bin/env bash

set -eux

source /etc/os-release
OUTPUT="$(pwd)/rootfs.tar"

NAME=nginx
PACKAGES="nginx"

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
-/usr/bin/python2
-/usr/bin/python2.7
-/usr/share/doc/*
-/usr/share/man/*
-/usr/share/info/*
-/usr/lib64/guile/*
-/usr/share/guile/*
-/lib/systemd/*
EOF

supermin --build --format chroot "${SUPERMIN_APPLIANCE}" -o "${DOCKER_CONTEXT}" --include-packagelist
pushd ${DOCKER_CONTEXT}
echo "cleaning out locales that are not english"
mv usr/share/locale/en* tmp
rm -fr usr/share/locale/*
mv tmp/en* usr/share/locale/

popd

pushd ${DOCKER_CONTEXT}
tar cf ${OUTPUT} .
popd
