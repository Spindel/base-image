NAME = fedora-26-meteor
REPO_NAME = registry.gitlab.com/modioab/base-image

PLATFORM=os.linux.x86_64
RELEASE=1.5

include ../docker-image.mk


$(IMAGE_FILENAME): meteor.tar.gz


meteor.tar.gz:
	curl -o meteor.tar.gz \
	    https://meteorinstall-4168.kxcdn.com/packages-bootstrap/${RELEASE}/meteor-bootstrap-${PLATFORM}.tar.gz
	sha256sum -c checksum
