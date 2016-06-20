.PHONY: all
all: clean-data build run-data run
	
.PHONY: build
build:
	docker build -t myjenkins jenkins-master/.
	docker build -t myjenkinsdata jenkins-data/.
.PHONY: run-data
run-data:
	-docker run --name=jenkins-data myjenkinsdata
.PHONY: run
run:
	docker run -p 8080:8080 --name=jenkins-master --volumes-from=jenkins-data -d myjenkins
.PHONY: start
start:
	docker start jenkins-master
.PHONY: stop
stop:
	-docker stop jenkins-master
.PHONY: clean
clean: stop
	-docker rm -v jenkins-master
.PHONY: clean-data
clean-data: clean
	-docker rm -v jenkins-data
.PHONY: clean-images
clean-images:
	docker rmi $(docker images -q --filter="dangling=true")

