DOCKER_IMAGE_NAME=jorge.137/j-os
DOCKER_CONTAINER_NAME=test-j-os-container
SRC_DIR=$(shell pwd)/src
DOCKER_RUN_PARAMS=-it --rm  --privileged=true -v $(SRC_DIR):/src --name $(DOCKER_CONTAINER_NAME)

build-image:
	@docker build -t $(DOCKER_IMAGE_NAME) .

remove-image:
	@echo Removing Docker image...
	@docker rmi $(DOCKER_IMAGE_NAME)

run-container: build-image
	@echo Starting Docker container...
	@echo docker run $(DOCKER_RUN_PARAMS) $(DOCKER_IMAGE_NAME) /bin/bash
	@docker run $(DOCKER_RUN_PARAMS) $(DOCKER_IMAGE_NAME) /bin/bash

