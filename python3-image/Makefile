include /etc/os-release
IMAGE_REPO = registry.gitlab.com/modioab/base-image
IMAGE_TAG_PREFIX = $(ID)-$(VERSION_ID)-python
IMAGE_FILES = rootfs.tar

rootfs.tar:
	../build-rootfs.sh python3 \
	    python3-pycurl \
	    python3-cryptography \
	    python3-pyOpenSSL \
	    python3-zope-interface \
	    python3-CacheControl \
	    python3-pip \
	    python3-dbus \
	    python3-netifaces

include ../build.mk
