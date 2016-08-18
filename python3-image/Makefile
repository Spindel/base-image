.PHONY: all build publish

all: build publish

rootfs: rootfs.tar.gz

rootfs.tar.gz: 
	./build-python-rootfs.sh

build:
	./build-python-docker.sh

publish:
	./publish-python-docker.sh
