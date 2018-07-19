FEDORA_ROOT_RELEASE ?= 28
IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)-c

FEDORA_ROOT_ARCHIVE = rootfs.tar
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_PACKAGES = make automake \
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
