#!/bin/bash

# Build a docker image building base docker image from a Fedora system

set -eu

if [ $(id -u) != 0 ]; then
  echo "You must be root" >&2
  exit 1
fi

source /etc/os-release

mkdir -p build/rootfs/etc/yum.repos.d
cd build
ROOTFS=$(realpath rootfs)
cat > rootfs/etc/yum.repos.d/docker.repo <<EOF
[docker]
baseurl = https://yum.dockerproject.org/repo/main/fedora/\$releasever/
gpgcheck = 1
gpgkey = https://yum.dockerproject.org/gpg
name = Docker repository
EOF

dnf --installroot=$ROOTFS --disablerepo='*' --enablerepo=fedora --enablerepo=docker --releasever=${VERSION_ID} --setopt=tsflags=nodocs install -y dnf make supermin docker-engine
echo tsflags=nodocs >> rootfs/etc/dnf/dnf.conf

dnf --installroot=$ROOTFS clean all

cat > Dockerfile <<EOF
FROM scratch
COPY rootfs /
EOF

docker build -t registry.gitlab.com/modioab/base-image:fedora-${VERSION_ID}-bootstrap-latest .
