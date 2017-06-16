include /etc/os-release
NAME = $(ID)-$(VERSION_ID)-nginx
REPO_NAME = registry.gitlab.com/modioab/base-image

include ../docker-image.mk

$(IMAGE_FILENAME): rootfs.tar

rootfs.tar:
	./build-nginx-rootfs.sh
