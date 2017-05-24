#!/bin/bash

# Build a docker image building base docker image from a Fedora system

set -eu

if [ $(id -u) != 0 ]; then
  echo "You must be root" >&2
  exit 1
fi

PACKAGES=" \
    dnf \
    make \
    supermin \
    docker-engine \
    git \
    xorg-x11-server-Xvfb \
    which \
    firefox \
    chromium \
    nodejs \
    yarn"

source /etc/os-release

mkdir -p build/rootfs/etc/yum.repos.d

cat > build/rootfs/etc/yum.repos.d/fedora.repo << EOF
[fedora]
name=Fedora \$releasever - \$basearch
failovermethod=priority
#baseurl=http://download.fedoraproject.org/pub/fedora/linux/releases/\$releasever/Everything/\$basearch/os/
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-\$releasever&arch=\$basearch
enabled=1
#metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False

[updates]
name=Fedora \$releasever - \$basearch - Updates
failovermethod=priority
#baseurl=http://download.fedoraproject.org/pub/fedora/linux/updates/\$releasever/\$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f\$releasever&arch=\$basearch
enabled=1
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
EOF

cd build
ROOTFS=$(realpath rootfs)

dnf --installroot=${ROOTFS} \
    --disablerepo='*' \
    --enablerepo=fedora \
    --enablerepo=updates \
    --releasever=${VERSION_ID} \
    --setopt=tsflags=nodocs \
    install -y \
    redhat-release

rpm --root=${ROOTFS} \
    -i \
    https://rpm.nodesource.com/pub_4.x/fc/25/x86_64/nodesource-release-fc25-1.noarch.rpm

rpm --root=${ROOTFS} \
    --import \
    rootfs/etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL

curl -o build/rootfs/etc/yum.repos.d/yarn.repo \
    https://dl.yarnpkg.com/rpm/yarn.repo

rpm --root=${ROOTFS} \
    --import https://dl.yarnpkg.com/rpm/pubkey.gpg

dnf --installroot=${ROOTFS} \
    --repofrompath=nodesource_x,https://rpm.nodesource.com/pub_6.x/fc/25/x86_64 \
    --repofrompath=yarn_x,https://dl.yarnpkg.com/rpm/ \
    --disablerepo='*' \
    --enablerepo=fedora \
    --enablerepo=updates \
    --enablerepo=nodesource_x \
    --enablerepo=yarn_x \
    --releasever=${VERSION_ID} \
    --setopt=tsflags=nodocs \
    install -y \
    ${PACKAGES}

echo tsflags=nodocs >> rootfs/etc/dnf/dnf.conf

dnf --installroot=${ROOTFS} clean all

cat > Dockerfile <<EOF
FROM scratch
COPY rootfs /
EOF

TAG=registry.gitlab.com/modioab/base-image:fedora-${VERSION_ID}-bootstrap-latest
docker build -t ${TAG} .
echo ${TAG}
