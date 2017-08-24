include /etc/os-release
IMAGE_REPO = registry.gitlab.com/modioab/base-image
IMAGE_TAG_PREFIX = $(ID)-$(VERSION_ID)-c
IMAGE_FILES = rootfs.tar

rootfs.tar:
	../build-rootfs.sh make automake \
	    gcc gcc-c++ \
	    glibc-headers \
	    clang clang-analyzer \
	    cppcheck



include ../build.mk
