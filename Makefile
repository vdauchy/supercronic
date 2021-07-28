# import config.
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# grep the version from the mix file
VERSION=$(shell ./version.sh)

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
build: ## Build the container
	docker build --build-arg VERSION=$(VERSION) -t $(APP_NAME):latest  -t $(APP_NAME):$(VERSION) .

build-nc: ## Build the container without caching
	docker build --no-cache --build-arg VERSION=$(VERSION) -t $(APP_NAME):latest  -t $(APP_NAME):$(VERSION) .

run: ## Run container
	docker run -i -t --rm --env-file=./config.env --name="$(APP_NAME)" $(APP_NAME)

up: build run ## Run container (Alias to run)

stop: ## Stop and remove a running container
	docker stop $(APP_NAME); docker rm $(APP_NAME)

version: ## Output the current version
	@echo $(VERSION)
