CACHE_VERSION=3.21.1
NEXUS_VERSION=3.22.1

build:
	docker build -t dockette/nexus:${NEXUS_VERSION} .

run: 
	docker run -it --rm -p 8081:8081 --name nexus dockette/nexus:${NEXUS_VERSION}

run-password: 
	docker exec -it nexus cat /nexus-data/admin.password

build-plugins:
	docker build -t dockette/nexus:plugins-${NEXUS_VERSION} -f Dockerfile.plugins .
