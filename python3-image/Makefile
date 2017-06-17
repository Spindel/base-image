include /etc/os-release
NAME = $(ID)-$(VERSION_ID)-python
REPO_NAME = registry.gitlab.com/modioab/base-image

ifeq ($(VERSION_ID),24)
ifeq ($(CI_BUILD_REF_NAME),master)
CI_BUILD_REF_NAME := latest
endif
endif

include ../docker-image.mk

$(IMAGE_FILENAME): rootfs.tar

rootfs.tar:
	../build-rootfs.sh python3 \
	    python3-pycurl \
	    python3-cryptography \
	    python3-pyOpenSSL \
	    python3-zope-interface \
	    python3-CacheControl \
	    python3-pip \
	    python3-netifaces
