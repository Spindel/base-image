include /etc/os-release

PLATFORM=os.linux.x86_64
RELEASE=1.6.1.1

IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-29/meteor
IMAGE_FILES = meteor.tar.gz
CLEANUP_FILES = meteor.tar.gz


include ../build.mk

meteor.tar.gz:
	curl -sS -o meteor.tar.gz \
	    https://static-meteor.netdna-ssl.com/packages-bootstrap/${RELEASE}/meteor-bootstrap-${PLATFORM}.tar.gz
	sha256sum -c checksum
