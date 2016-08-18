NAME = debian-armv7
REPO_NAME = registry.gitlab.com/modioab/base-image

.PHONY: all build publish

all: build publish

rootfs: 
	./generate-arm-rootfs.sh

build:
	docker build --rm=true \
	    --tag=$(REPO_NAME):$(NAME)-latest \
	    --file Dockerfile .
publish:
	docker push $(REPO_NAME):$(NAME)-latest
