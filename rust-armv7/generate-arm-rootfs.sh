#!/usr/bin/env bash
set -eux

uname -p | grep x86 && exit 1

export DEBIAN_FRONTEND=noninteractive
CWD=$(pwd)


TMPDIR=$(mktemp -d rootfs.XXXXX)
trap "chmod -R u+w $TMPDIR; rm -rf $TMPDIR" EXIT

PACKAGES="bash,curl,make,libc6-dev,gcc,pkg-config,libdbus-1-dev,ca-certificates"
# Create basic root
debootstrap --include=${PACKAGES} stretch $TMPDIR
mkdir -p $TMPDIR/usr/local/bin
install rustup.sh $TMPDIR/usr/local/bin/rustup.sh
mount --bind /proc $TMPDIR/proc
chroot $TMPDIR /bin/bash /usr/local/bin/rustup.sh -y
chroot $TMPDIR /root/.cargo/bin/rustup component add rustfmt-preview
umount $TMPDIR/proc

tar -cf rootfs.tar -C $TMPDIR .
