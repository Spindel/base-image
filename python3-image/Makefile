IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/python
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_RELEASE ?= 31
FEDORA_ROOT_PACKAGES += python3
FEDORA_ROOT_PACKAGES += python3-pycurl
FEDORA_ROOT_PACKAGES += python3-pip
FEDORA_ROOT_PACKAGES += python3-cryptography
FEDORA_ROOT_PACKAGES += python3-pyOpenSSL
FEDORA_ROOT_PACKAGES += python3-zope-interface
FEDORA_ROOT_PACKAGES += python3-CacheControl
FEDORA_ROOT_PACKAGES += python3-dbus
FEDORA_ROOT_PACKAGES += python3-netifaces
FEDORA_ROOT_PACKAGES += python3-ujson
# Some binary python packages require the c++ standard library.
FEDORA_ROOT_PACKAGES += libstdc++

include ../build.mk
