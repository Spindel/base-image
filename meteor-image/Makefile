METEOR_RELEASE ?= 1.10.1

IMAGE_REPO = $(CI_REGISTRY_IMAGE)/fedora-$(FEDORA_ROOT_RELEASE)/meteor-$(METEOR_RELEASE)
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)
IMAGE_FILES += meteor.tar.gz

FEDORA_ROOT_ARCHIVE = rootfs.tar

FEDORA_ROOT_PACKAGES += sqlite
FEDORA_ROOT_PACKAGES += git
FEDORA_ROOT_PACKAGES += docker
FEDORA_ROOT_PACKAGES += procps-ng
FEDORA_ROOT_PACKAGES += python2
FEDORA_ROOT_PACKAGES += gcc-c++
FEDORA_ROOT_PACKAGES += make
FEDORA_ROOT_PACKAGES += findutils

PLATFORM = os.linux.x86_64

CLEANUP_FILES = meteor.tar.gz

include ../build.mk

meteor.tar.gz:
	curl -sS -o meteor.tar.gz \
	    https://static-meteor.netdna-ssl.com/packages-bootstrap/$(METEOR_RELEASE)/meteor-bootstrap-$(PLATFORM).tar.gz
	sha256sum -c checksum-$(METEOR_RELEASE)
