include /etc/os-release
NAME = $(ID)-$(VERSION_ID)-python
REPO_NAME = registry.gitlab.com/modioab/base-image
CI_BUILD_REF_NAME ?= build
LOCAL_TAG = $(REPO_NAME):$(NAME)-$(CI_BUILD_REF_NAME)
TAG = $(REPO_NAME):$(NAME)-latest
ROOTFS_ARCHIVE = rootfs.tar.gz

.PHONY: all rootfs build publish

all: build publish

rootfs: $(ROOTFS_ARCHIVE)

$(ROOTFS_ARCHIVE):
	./build-python-rootfs.sh

build: $(ROOTFS_ARCIVE)
	docker build --tag=$(LOCAL_TAG) .

publish:
	docker tag $(LOCAL_TAG) $(TAG)
	docker rmi $(LOCAL_TAG)
	docker push $(TAG)
