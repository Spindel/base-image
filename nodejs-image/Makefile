IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/nodejs
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_RELEASE ?= 31
FEDORA_ROOT_PACKAGES += nodejs-yarn
FEDORA_ROOT_PACKAGES += nodejs
FEDORA_ROOT_PACKAGES += npm

include ../build.mk
