IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/bootstrap
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_RELEASE ?= 31

FEDORA_ROOT_PACKAGES += fedora-release
FEDORA_ROOT_PACKAGES += dnf
FEDORA_ROOT_PACKAGES += make
FEDORA_ROOT_PACKAGES += supermin
FEDORA_ROOT_PACKAGES += runc
FEDORA_ROOT_PACKAGES += podman
FEDORA_ROOT_PACKAGES += buildah
FEDORA_ROOT_PACKAGES += git
FEDORA_ROOT_PACKAGES += xorg-x11-server-Xvfb
FEDORA_ROOT_PACKAGES += which
FEDORA_ROOT_PACKAGES += firefox
FEDORA_ROOT_PACKAGES += chromium
FEDORA_ROOT_PACKAGES += nodejs
FEDORA_ROOT_PACKAGES += python3-pip
FEDORA_ROOT_PACKAGES += python3-ujson
FEDORA_ROOT_PACKAGES += nodejs-yarn
FEDORA_ROOT_PACKAGES += npm
# Required by clientconfig
FEDORA_ROOT_PACKAGES += rsync
# Required by clientconfig
FEDORA_ROOT_PACKAGES += xz
# Required by distribution
FEDORA_ROOT_PACKAGES += zstd
# Required for python wheel/compiling
FEDORA_ROOT_PACKAGES += gcc
# Required for python wheel/compiling
FEDORA_ROOT_PACKAGES += python3-devel

include ../build.mk
