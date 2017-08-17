include /etc/os-release
IMAGE_REPO = registry.gitlab.com/modioab/base-image
IMAGE_TAG_PREFIX = $(ID)-$(VERSION_ID)-nginx
IMAGE_FILES = rootfs.tar
CLEANUP_FILES = rootfs.tar

include ../build.mk

rootfs.tar:
	../build-rootfs.sh nginx
