include /etc/os-release

PLATFORM=os.linux.x86_64
RELEASE=1.5.2

IMAGE_REPO = registry.gitlab.com/modioab/base-image
IMAGE_TAG_PREFIX = $(ID)-$(VERSION_ID)-meteor
IMAGE_FILES = meteor.tar.gz
CLEANUP_FILES = meteor.tar.gz


include ../build.mk

meteor.tar.gz:
	curl -o meteor.tar.gz \
	    https://meteorinstall-4168.kxcdn.com/packages-bootstrap/${RELEASE}/meteor-bootstrap-${PLATFORM}.tar.gz
	sha256sum -c checksum
