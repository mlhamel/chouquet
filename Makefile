.DEFAULT_GOAL = help

# Project variables
NAME          := chouquet
VENDOR        := mlhamel.org
URL           := https://github.com/mlhamel/chouquet

# Build variables
COMMIT_HASH := $(shell git rev-parse --short HEAD 2>/dev/null)
VERSION     := $(shell git describe --tags --exact-match 2>/dev/null || git describe --tags 2>/dev/null || echo "v0.0.0-$(COMMIT_HASH)")

.PHONY: build
build: log-build ## Build binary
	go build -o bin/chouquet ./cmd/chouquet/main.go

.PHONY: help
help:
	@ grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

log-%:
	@ grep -h -E '^$*:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m==> %s\033[0m\n", $$2}'
