NEXUS_VERSION ?= 3.82.1-java17-ubi

.PHONY: build
build:
	docker buildx \
		build \
		--build-arg NEXUS_VERSION=${NEXUS_VERSION} \
		--platform linux/amd64 \
		-t dockette/nexus \
		.

.PHONY: run
run: 
	docker run -it --rm -p 8081:8081 --name nexus dockette/nexus

.PHONY: run-password
run-password: 
	docker exec -it nexus cat /nexus-data/admin.password
