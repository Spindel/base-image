#!/usr/bin/env bash
set -eux

export DEBIAN_FRONTEND=noninteractive
CWD=$(pwd)


TMPDIR=$(mktemp -d rootfs.XXXXX)
trap "chmod -R u+w $TMPDIR; rm -rf $TMPDIR" EXIT

# Create basic root
debootstrap testing $TMPDIR

# Install extra deps for modio-distribution
chroot $TMPDIR apt-get update
chroot $TMPDIR apt-get -qq -y install multistrap squashfs-tools dracut xdelta3
chroot $TMPDIR apt-get clean

# create an archive
pushd $TMPDIR
tar czf $CWD/rootfs.tar.gz .
popd