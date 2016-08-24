include /etc/os-release
NAME = $(ID)-$(VERSION_ID)-python
REPO_NAME = registry.gitlab.com/modioab/base-image

include ../rootfs-docker-image.mk

rootfs:
	./build-python-rootfs.sh
