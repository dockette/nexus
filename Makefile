build:
	docker build -t dockette/nexus .

run: 
	docker run -it --rm -p 8081:8081 --name nexus dockette/nexus

run-password: 
	docker exec -it nexus cat /nexus-data/admin.password
