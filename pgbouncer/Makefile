FEDORA_ROOT_RELEASE ?= 31
IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/pgbouncer
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)
IMAGE_FILES += pgbouncer_exporter

CLEANUP_FILES += pgbouncer_exporter

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_PACKAGES = pgbouncer
FEDORA_ROOT_PACKAGES += postgresql

include ../build.mk

pgbouncer_exporter:
	./download
