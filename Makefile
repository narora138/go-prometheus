.PHONY: build-go build-docker
.DEFAULT_GOAL: all

build-go:
	go mod tidy
	go build -o server .

build-docker:
	docker build -t my-golang-app .

all: build-go build-docker