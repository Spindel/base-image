IMAGE_REPO = registry.gitlab.com/modioab/base-image
IMAGE_TAG_PREFIX = debian-armv7
IMAGE_FILES = rootfs.tar

include ../build.mk

rootfs.tar:
	./generate-arm-rootfs.sh
