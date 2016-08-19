NAME = zabbix-web
REPO_NAME = registry.gitlab.com/modioab/base-image
TAG = $(REPO_NAME):$(NAME)-latest
IMAGE_FILENAME = $(NAME)-image.tar.gz

.PHONY: build save load publish

build:
	docker build --pull --no-cache \
	    --tag=$(TAG) \
	    .

save: $(IMAGE_FILENAME)

$(IMAGE_FILENAME):
	docker save $(TAG) | gzip > $@

load: $(IMAGE_FILENAME)
	gunzip < $< | docker load

publish:
	docker push $(TAG)
