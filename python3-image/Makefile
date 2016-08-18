.PHONY: all build publish
include /etc/os-release
NAME=python
REPO_NAME:=registry.gitlab.com/modioab/base-image:$(ID)-$(VERSION_ID)-$(NAME)-latest
all: build publish

rootfs: rootfs.tar.gz

rootfs.tar.gz: 
	./build-python-rootfs.sh

build:
	docker build --tag="$(REPO_NAME)" .

publish:
	docker push "$(REPO_NAME)"
