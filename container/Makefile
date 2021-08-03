IMAGE_REPO = registry.gitlab.com/modioab/base-image/fedora-$(FEDORA_ROOT_RELEASE)/container
IMAGE_ARCHIVE = image.tar
IMAGE_FILES += $(FEDORA_ROOT_ARCHIVE)

FEDORA_ROOT_ARCHIVE = rootfs.tar
FEDORA_ROOT_PACKAGES += make
FEDORA_ROOT_PACKAGES += dnf
FEDORA_ROOT_PACKAGES += curl
FEDORA_ROOT_PACKAGES += git
FEDORA_ROOT_PACKAGES += tar
FEDORA_ROOT_PACKAGES += findutils
FEDORA_ROOT_PACKAGES += podman
FEDORA_ROOT_PACKAGES += fedora-release
FEDORA_ROOT_PACKAGES += crun
FEDORA_ROOT_PACKAGES += runc
FEDORA_ROOT_PACKAGES += buildah

IMAGE_RUN_ARGS = -v $$tmpdir:/test:z --privileged
IMAGE_RUN_CMD = make -C /test build-publish

include ../build.mk

.PHONY: no-build-publish
no-build-publish:
	$(error Avoid pushing untested images. Use "build", "test" and "publish" instead)

build-publish: no-build-publish

# Verify that a new `container` image can successfully build and push
# images. If it can't, much of container image building in CI will be
# broken.
.PHONY: test
test:
ifeq ($(REGISTRY_AUTH_FILE),)
	$(error CI needs to be set, or REGISTRY_AUTH_FILE needs to be specified)
else
	tmpdir=$$(pwd)/$$(mktemp -d test.XXXXX) && \
	  trap "rm -rf -- \"$$tmpdir\"" EXIT INT TERM && \
	  cp ../build.mk "$$tmpdir" && \
	  cp $(REGISTRY_AUTH_FILE) "$$tmpdir"/auth.json && \
	  cp test/* "$$tmpdir" && \
	  (cd "$$tmpdir" && \
	   git init && \
	   git add build.mk Makefile Dockerfile && \
	   git -c user.email=nobody@example.com -c user.name=nobody commit -m "Add test files") && \
	  $(MAKE) load && \
	  export tmpdir && \
	  $(MAKE) run-image; $(RECORD_TEST_STATUS) \
	  rm -rf -- "$$tmpdir" && \
	  $(MAKE) remove-local-image && \
	  $(RETURN_TEST_STATUS)
endif


.PHONY: new-gpg-key
# This target is a documentation on how the keys were generated
new-gpg-key:
	gpg --batch --passphrase '' --quick-generate-key gitlab.com/modioab ed25519
	gpg --armor --export gitlab.com/modioab > gitlab_com_modioab.pub
	gpg --armor --export-secret-keys gitlab.com/modioab > gitlab_com_modioab.priv
	gpg --batch --delete-secret-and-public-key gitlab.com/modioab
