CI_BUILD_REF_NAME ?= build
LOCAL_TAG = $(REPO_NAME):$(NAME)-$(CI_BUILD_REF_NAME)
TAG = $(REPO_NAME):$(NAME)-latest
IMAGE_FILENAME = $(NAME)-image.tar

.PHONY: build save load publish

build:
	docker build --pull --no-cache \
	    --tag=$(LOCAL_TAG) \
	    .

save: $(IMAGE_FILENAME)

$(IMAGE_FILENAME):
	docker save $(LOCAL_TAG) > $@
	docker rmi $(LOCAL_TAG)

load: $(IMAGE_FILENAME)
	docker load < $<

publish:
	docker tag $(LOCAL_TAG) $(TAG)
	docker rmi $(LOCAL_TAG)
	docker push $(TAG)