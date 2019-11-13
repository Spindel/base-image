IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/go
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_RELEASE ?= 28
FEDORA_ROOT_PACKAGES = make golang git tar runc

include ../build.mk
