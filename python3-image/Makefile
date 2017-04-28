include /etc/os-release
NAME = $(ID)-$(VERSION_ID)-python
REPO_NAME = registry.gitlab.com/modioab/base-image

ifeq ($(VERSION_ID),24)
TAG = $(REPO_NAME):$(NAME)-latest
endif

include ../rootfs-docker-image.mk

rootfs:
	./build-python-rootfs.sh
