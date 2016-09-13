APP_NAME=go-fib-cpu-waste
IMAGE=simonswine/$(APP_NAME)
VERSION=0.1

$(APP_NAME):
	CGO_ENABLED=0 GOOS=linux godep go build \
		-a -tags netgo \
		-o ${APP_NAME}

clean:
	rm -f $(APP_NAME)

docker_build: $(APP_NAME)
	docker build -t $(IMAGE):latest .
	docker tag $(IMAGE):latest $(IMAGE):$(VERSION)

docker_push: docker_build
	echo $(IMAGE):latest $(IMAGE):$(VERSION) | xargs -n 1 docker push
