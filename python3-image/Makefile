include /etc/os-release
NAME = $(ID)-$(VERSION_ID)-python
REPO_NAME = registry.gitlab.com/modioab/base-image

ifeq ($(VERSION_ID),24)
TAG = $(REPO_NAME):$(NAME)-latest
endif

include ../docker-image.mk

build: rootfs.tar

rootfs.tar:
	./build-python-rootfs.sh
