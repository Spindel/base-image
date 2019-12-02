IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/bootstrap
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_RELEASE ?= 31

FEDORA_ROOT_PACKAGES += fedora-release
FEDORA_ROOT_PACKAGES += dnf
FEDORA_ROOT_PACKAGES += make
FEDORA_ROOT_PACKAGES += runc
FEDORA_ROOT_PACKAGES += podman
FEDORA_ROOT_PACKAGES += buildah
FEDORA_ROOT_PACKAGES += git

# Required by many shellscripts
FEDORA_ROOT_PACKAGES += which

# Required by javascript build jobs
FEDORA_ROOT_PACKAGES += nodejs
FEDORA_ROOT_PACKAGES += nodejs-yarn
FEDORA_ROOT_PACKAGES += npm

# Required for python installation
FEDORA_ROOT_PACKAGES += python3-pip
FEDORA_ROOT_PACKAGES += python3-ujson
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

# Required by ModioAB/mytemp-backend tests
FEDORA_ROOT_PACKAGES += python3-dbus


include ../build.mk
