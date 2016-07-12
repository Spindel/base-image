NAME = frontend
REPO_NAME = registry.gitlab.com/modioab/base-image
RELEASE_TAG := $(shell date +%Y%m%dT%H%M)

.PHONY: all build publish

all: build publish

build:
	docker build \
	    --tag=$(REPO_NAME):$(NAME)-latest \
	    --tag=$(REPO_NAME):$(NAME)-$(RELEASE_TAG) \
	    --file Dockerfile .

publish:
	docker push $(REPO_NAME):$(NAME)-latest
	docker push $(REPO_NAME):$(NAME)-$(RELEASE_TAG)

