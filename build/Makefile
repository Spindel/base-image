NAME = fedora-24-build
REPO_NAME = registry.gitlab.com/modioab/base-image
CI_BUILD_REF_NAME ?= build
LOCAL_TAG = $(REPO_NAME):$(NAME)-$(CI_BUILD_REF_NAME)
TAG = $(REPO_NAME):$(NAME)-latest
IMAGE_FILENAME = $(NAME)-image.tar.gz

.PHONY: build save load publish

build:
	docker build --pull --no-cache \
	    --tag=$(LOCAL_TAG) \
	    .

save: $(IMAGE_FILENAME)

$(IMAGE_FILENAME):
	docker save $(LOCAL_TAG) | gzip > $@
	docker rmi $(LOCAL_TAG)

load: $(IMAGE_FILENAME)
	gunzip < $< | docker load

publish:
	docker tag $(LOCAL_TAG) $(TAG)
	docker rmi $(LOCAL_TAG)
	docker push $(TAG)
