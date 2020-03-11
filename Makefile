NEXUS_VERSION=3.21.1

build:
	docker build -t dockette/nexus:${NEXUS_VERSION} .

run: 
	docker run -it --rm -p 8081:8081 --name nexus dockette/nexus:${NEXUS_VERSION}

run-password: 
	docker exec -it nexus cat /nexus-data/admin.password

build-plugins:
	docker build -t dockette/nexus:plugins-${NEXUS_VERSION} -f Dockerfile.plugins .

build-plugin-cargo:
	docker build -t dockette/nexus:plugin-cargo -f plugin/cargo/Dockerfile .

build-plugin-chef:
	docker build -t dockette/nexus:plugin-chef -f plugin/chef/Dockerfile .

build-plugin-composer:
	docker build -t dockette/nexus:plugin-composer -f plugin/composer/Dockerfile .

build-plugin-conan:
	docker build -t dockette/nexus:plugin-conan -f plugin/conan/Dockerfile .

build-plugin-cpan:
	docker build -t dockette/nexus:plugin-cpan -f plugin/cpan/Dockerfile .

build-plugin-helm:
	docker build -t dockette/nexus:plugin-helm -f plugin/helm/Dockerfile .

build-plugin-p2:
	docker build -t dockette/nexus:plugin-p2 -f plugin/p2/Dockerfile .

build-plugin-puppet:
	docker build -t dockette/nexus:plugin-puppet -f plugin/puppet/Dockerfile .

build-plugin-vgo:
	docker build -t dockette/nexus:plugin-vgo -f plugin/vgo/Dockerfile .

build-plugin-azure:
	docker build -t dockette/nexus:plugin-azure -f plugin/azure/Dockerfile .

build-plugin-google:
	docker build -t dockette/nexus:plugin-google -f plugin/google/Dockerfile .
