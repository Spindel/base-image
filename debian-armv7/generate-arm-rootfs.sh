#!/usr/bin/env bash
set -eux

uname -p | grep x86 && exit 1

export DEBIAN_FRONTEND=noninteractive
CWD=$(pwd)


TMPDIR=$(mktemp -d rootfs.XXXXX)
trap "chmod -R u+w $TMPDIR; rm -rf $TMPDIR" EXIT

PACKAGES="multistrap,squashfs-tools,dracut,xdelta3,unzip,xz-utils,dbus,util-linux,e2fsprogs,dosfstools,tar,make,git,automake,libtool"
# Create basic root
debootstrap --include=${PACKAGES} jessie $TMPDIR

# create an archive
pushd $TMPDIR
tar czf $CWD/rootfs.tar.gz .
popd
