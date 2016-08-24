CI_BUILD_REF_NAME ?= build
LOCAL_TAG = $(REPO_NAME):$(NAME)-$(CI_BUILD_REF_NAME)
TAG = $(REPO_NAME):$(NAME)-latest

.PHONY: rootfs build publish

rootfs: $(ROOTFS_ARCHIVE)

$(ROOTFS_ARCHIVE):
	$(BUILD_ROOTFS_ARCHIVE)

build: $(ROOTFS_ARCIVE)
	docker build --tag=$(LOCAL_TAG) .

publish:
	docker tag $(LOCAL_TAG) $(TAG)
	docker rmi $(LOCAL_TAG)
	docker push $(TAG)
