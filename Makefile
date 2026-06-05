DOCKER_IMAGE=dockette/nexus
DOCKER_TAG?=latest
DOCKER_PLATFORM?=linux/amd64
NEXUS_VERSION ?= 3.82.1-java17-ubi
DOCKER_TEST_TIMEOUT?=600

.PHONY: build
build:
	docker buildx \
		build \
		--build-arg NEXUS_VERSION=${NEXUS_VERSION} \
		--platform ${DOCKER_PLATFORM} \
		-t ${DOCKER_IMAGE}:${DOCKER_TAG} \
		.

.PHONY: test
test:
	docker rm -f nexus-test >/dev/null 2>&1 || true
	docker run -d --name nexus-test -p 127.0.0.1:8081:8081 ${DOCKER_IMAGE}:${DOCKER_TAG}
	trap 'docker rm -f nexus-test >/dev/null 2>&1 || true' EXIT; \
		for i in $$(seq 1 ${DOCKER_TEST_TIMEOUT}); do \
			status=$$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8081/ || true); \
			if [ "$$status" != "000" ] && [ "$$status" -lt 500 ]; then \
				exit 0; \
			fi; \
			sleep 1; \
		done; \
		docker logs nexus-test; \
		exit 1

.PHONY: run
run: 
	docker run -it --rm -p 8081:8081 --name nexus ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: run-password
run-password: 
	docker exec -it nexus cat /nexus-data/admin.password
