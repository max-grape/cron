PROJECT_NAME = github.com/max-grape/cron

REGISTRY = ghcr.io
IMAGE    = $(REGISTRY)/$(PROJECT_NAME)
TAG      = latest

IMAGE_ALPINE = alpine:3.14.0

build:
	docker build \
		--build-arg IMAGE_ALPINE=$(IMAGE_ALPINE) \
		-t $(IMAGE):$(TAG) .
