DOCKER_IMAGE_NAME=jorge.137/j-os
DOCKER_CONTAINER_NAME=test-j-os-container
SRC_DIR=$(CURDIR)/src
DOCKER_RUN_PARAMS=-it --rm  --privileged=true -v $(SRC_DIR):/src --name $(DOCKER_CONTAINER_NAME)

build-image:
	@docker build --no-cache -t $(DOCKER_IMAGE_NAME) .

remove-image:
	@echo Removing Docker image...
	@docker rmi $(DOCKER_IMAGE_NAME)

quick-run:	
	@echo Starting Docker container...
	@echo docker run $(DOCKER_RUN_PARAMS) $(DOCKER_IMAGE_NAME) /bin/bash
	@docker run $(DOCKER_RUN_PARAMS) $(DOCKER_IMAGE_NAME) /bin/bash

run-container: build-image && quick-run

# hotkeys
bi: build-image
rmi: remove-image
runc: run-container
qr: quick-run