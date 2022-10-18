## Build a test image using a `container` image

IMAGE_REPO = $(CI_REGISTRY_IMAGE)/test-dummy

include build.mk

# In the current environment, podman only seems to properly read auth
# config when it is stored in the docker location.
REGISTRY_AUTH_FILE = /root/.docker/config.json

# Export REGISTRY_AUTH_FILE anyway, since this is the documented way
# to specify the auth file location.
export REGISTRY_AUTH_FILE

# Login credentials are provided in a volume. Copy them into the
# correct location. We do this because `podman login` seems to not
# work inside the container.
$(REGISTRY_AUTH_FILE):
	mkdir -p $$(dirname $@)
	cp /test/auth.json $@

build-publish: $(REGISTRY_AUTH_FILE)
