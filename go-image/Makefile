include /etc/os-release
IMAGE_REPO = registry.gitlab.com/modioab/base-image/$(ID)-$(VERSION_ID)/go
IMAGE_FILES += rootfs.tar

rootfs.tar:
	../build-rootfs.sh make golang git


include ../build.mk
