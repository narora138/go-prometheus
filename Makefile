.PHONY: build-go build-docker
.DEFAULT_GOAL:= run

build-go:
	go mod tidy
	go build -o server .

build-docker:
	docker build -t my-golang-app .

run-docker:
	docker compose up -d

run: build-docker run-docker

# Pings the local server to gather 
# the metrics as the prom server would
local-test:
	curl localhost:8080/metrics

clean:
	-rm server
	docker compose down