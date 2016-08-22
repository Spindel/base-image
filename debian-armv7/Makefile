NAME = debian-armv7
REPO_NAME = registry.gitlab.com/modioab/base-image
CI_BUILD_ID ?= build
LOCAL_TAG = $(REPO_NAME):$(NAME)-$(CI_BUILD_ID)
TAG = $(REPO_NAME):$(NAME)-latest
ROOTFS_ARCHIVE = rootfs.tar.gz

.PHONY: all rootfs build publish

all: build publish

rootfs: $(ROOTFS_ARCHIVE)

$(ROOTFS_ARCHIVE):
	./generate-arm-rootfs.sh

build: $(ROOTFS_ARCHIVE)
	docker build \
	    --tag=$(LOCAL_TAG) \
	    .
publish:
	docker tag $(LOCAL_TAG) $(TAG)
	docker rmi $(LOCAL_TAG)
	docker push $(TAG)
