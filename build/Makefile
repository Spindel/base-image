NAME = fedora-24-build
REPO_NAME = registry.gitlab.com/modioab/base-image
RELEASE_TAG := $(shell date +%Y%m%dT%H%M)

.PHONY: all build publish

all: build publish

build:
	docker build --rm=true --no-cache \
	    --tag=$(REPO_NAME):$(NAME)-latest \
	    --file Dockerfile .

publish:
	docker push $(REPO_NAME):$(NAME)-latest

