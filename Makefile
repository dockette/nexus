NEXUS_VERSION ?= 3.70.1

.PHONY: build
build:
	docker build --build-arg NEXUS_VERSION=${NEXUS_VERSION} -t dockette/nexus .

.PHONY: run
run: 
	docker run -it --rm -p 8081:8081 --name nexus dockette/nexus

.PHONY: run-password
run-password: 
	docker exec -it nexus cat /nexus-data/admin.password
