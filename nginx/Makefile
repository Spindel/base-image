IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/nginx
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_RELEASE ?= 31
FEDORA_ROOT_PACKAGES = nginx

include ../build.mk
