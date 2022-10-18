IMAGE_REPO = $(CI_REGISTRY_IMAGE)/fedora-$(FEDORA_ROOT_RELEASE)/c
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
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
