#!/usr/bin/env bash
set -eux

source /etc/os-release
OUTPUT="$(pwd)/rootfs.tar"

PACKAGES="$@"

TMPDIR=$(mktemp -d supermin-docker.XXXXX)
SUPERMIN_APPLIANCE="${TMPDIR}/appliance.o"
DOCKER_CONTEXT="${TMPDIR}/appliance.docker"

trap "chmod -R u+w $TMPDIR; rm -rf $TMPDIR" EXIT


dnf install -y ${PACKAGES}
supermin --prepare ${PACKAGES} -o "${SUPERMIN_APPLIANCE}"

# Exclude files 
cat  excludefiles >  "${SUPERMIN_APPLIANCE}/excludefiles"

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
