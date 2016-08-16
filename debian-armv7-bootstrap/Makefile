NAME = debian-armv7-bootstrap
REPO_NAME = registry.gitlab.com/modioab/base-image

.PHONY: all build publish

all: build publish

build:
	docker build --rm=true \
	    --tag=$(REPO_NAME):$(NAME) \
	    --file Dockerfile .
publish:
	docker push $(REPO_NAME):$(NAME)
