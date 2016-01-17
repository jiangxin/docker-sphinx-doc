all:
	@echo "build: build gotgit/sphinx-doc"
	@echo "run:   run docker image"

build:
	@docker build -t gotgit/sphinx-doc .

run:
	@docker run -it gotgit/sphinx-doc /bin/bash

.PHONY: all build run
