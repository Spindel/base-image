CI_BUILD_REF_NAME ?= build
LOCAL_TAG = $(REPO_NAME):$(NAME)-$(CI_BUILD_REF_NAME)
TAG = $(REPO_NAME):$(NAME)-latest

.PHONY: rootfs build publish

build: rootfs
	docker build --tag=$(LOCAL_TAG) .

publish:
	docker tag $(LOCAL_TAG) $(TAG)
	docker rmi $(LOCAL_TAG)
	docker push $(TAG)
