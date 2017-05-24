### Docker image

.PHONY: coverage build save load publish

# The branch or tag name for which project is built
CI_BUILD_REF_NAME ?= $(shell git rev-parse --abbrev-ref HEAD)
CI_BUILD_REF_NAME := $(subst /,_,$(CI_BUILD_REF_NAME))
CI_BUILD_REF_NAME := $(subst \#,_,$(CI_BUILD_REF_NAME))

# The commit revision for which project is built
CI_BUILD_REF ?= $(shell git rev-parse HEAD)

# The unique id of the current pipeline that GitLab CI uses internally
CI_PIPELINE_ID ?= no-pipeline

# The unique id of runner being used
HOST := $(shell uname -a)

# Build timestamp
DATE := $(shell date --iso=minutes)

# URL
CI_PROJECT_URL ?= http://localhost.localdomain/

# Unique for this build
LOCAL_TAG = $(REPO_NAME):$(NAME)-$(CI_PIPELINE_ID)

# Final tag
TAG = $(REPO_NAME):$(NAME)-$(CI_BUILD_REF_NAME)
IMAGE_FILENAME = $(NAME)-image.tar

# Git archive
ARCHIVE_FILENAME = $(NAME).tar

# The git ref file indicating the age of HEAD
HEAD_REF = $(shell git rev-parse --symbolic-full-name HEAD)
REF_FILE = $(shell git rev-parse --git-path $(HEAD_REF))

.PHONY: build save load publish

build: $(IMAGE_FILENAME)


$(IMAGE_FILENAME):
	docker build --pull --no-cache \
	    --build-arg=BRANCH="$(CI_BUILD_REF_NAME)" \
	    --build-arg=COMMIT="$(CI_BUILD_REF)" \
	    --build-arg=URL="$(CI_PROJECT_URL)" \
	    --build-arg=DATE="$(DATE)" \
	    --build-arg=HOST="$(HOST)" \
	    --tag=$(LOCAL_TAG) \
	    .
	docker save $(LOCAL_TAG) > $@
	docker rmi $(LOCAL_TAG)

load:
	docker load < $(IMAGE_FILENAME)

publish:
	docker tag $(LOCAL_TAG) $(TAG)
	docker rmi $(LOCAL_TAG)
	docker push $(TAG)
