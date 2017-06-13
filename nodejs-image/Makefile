include /etc/os-release
NAME = $(ID)-$(VERSION_ID)-nodejs
REPO_NAME = registry.gitlab.com/modioab/base-image

ifeq ($(VERSION_ID),24)
ifeq ($(CI_BUILD_REF_NAME),master)
CI_BUILD_REF_NAME := latest
endif
endif

include ../docker-image.mk

$(IMAGE_FILENAME): rootfs.tar

rootfs.tar:
	./build-nodejs-rootfs.sh
