include /etc/os-release
IMAGE_REPO = registry.gitlab.com/modioab/base-image
IMAGE_TAG_PREFIX = $(ID)-$(VERSION_ID)-c
IMAGE_FILES = rootfs.tar

rootfs.tar:
	../build-rootfs.sh make automake \
	    gcc gcc-c++ binutils \
	    glibc-headers \
	    clang clang-analyzer \
	    cppcheck \
	    avr-gcc avr-libc avr-gcc-c++ avr-binutils \
	    arm-none-eabi-binutils-cs \
	    arm-none-eabi-gcc-cs-c++ \
	    arm-none-eabi-gcc-cs \
	    arm-none-eabi-newlib \
	    srecord \
	    git


include ../build.mk
