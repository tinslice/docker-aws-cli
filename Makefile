#!make

export DOCKER_REPO = tinslice/aws-cli

build-alpine:
	bash alpine/hooks/build

build-debian:
	bash debian/hooks/build

