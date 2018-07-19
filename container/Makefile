IMAGE_REPO = registry.gitlab.com/modioab/base-image/container
FEDORA_ROOT_ARCHIVE = rootfs.tar
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)


FEDORA_ROOT_PACKAGES += docker-engine
FEDORA_ROOT_PACKAGES += make
FEDORA_ROOT_PACKAGES += dnf
FEDORA_ROOT_PACKAGES += curl
FEDORA_ROOT_PACKAGES += git
FEDORA_ROOT_PACKAGES += podman
FEDORA_ROOT_PACKAGES += fedora-release
FEDORA_ROOT_PACKAGES += buildah

include ../build.mk
