#!/usr/bin/env bash
set -eux

uname -p | grep x86 && exit 1

export DEBIAN_FRONTEND=noninteractive
CWD=$(pwd)


TMPDIR=$(mktemp -d rootfs.XXXXX)
trap "chmod -R u+w $TMPDIR; rm -rf $TMPDIR" EXIT

PACKAGES="bash,curl,make,libc6-dev,gcc,pkg-config,libdbus-1-dev,ca-certificates,rustc"
# Create basic root
debootstrap --include=${PACKAGES} stretch $TMPDIR
tar -cf rootfs.tar -C $TMPDIR .
