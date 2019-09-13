FEDORA_ROOT_RELEASE ?= 30
IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/pgbouncer
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_PACKAGES = pgbouncer
FEDORA_ROOT_PACKAGES += postgresql

include ../build.mk
