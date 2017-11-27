IMAGE_REPO = registry.gitlab.com/modioab/base-image/rust-image-armv7
IMAGE_FILES = rootfs.tar

include ../build.mk


rootfs.tar:
	mkosi
	tar -cf rootfs.tar -C image .
