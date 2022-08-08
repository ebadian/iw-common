.PHONY: docker
docker:
	@echo "Dockerising application."
	docker build -t demo/$(projectName) .

.PHONY: docker-push
docker-push:
	docker tag demo/iw-jokes:latest 582881472556.dkr.ecr.eu-west-2.amazonaws.com/demo-dev:latest
	docker push 582881472556.dkr.ecr.eu-west-2.amazonaws.com/demo-dev:latest

.PHONY: build
build:	buildApp docker
