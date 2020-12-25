# docker-aws-cli

[![Docker Automated build](https://img.shields.io/docker/cloud/automated/tinslice/azure-cli.svg?style=flat)](https://hub.docker.com/r/tinslice/aws-cli/builds)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/tinslice/aws-cli.svg?style=flat)](https://hub.docker.com/r/tinslice/aws-cli/builds)
[![license](https://img.shields.io/github/license/tinslice/docker-aws-cli.svg)](https://github.com/tinslice/docker-aws-cli)

Docker image with aws cli, terraform, ansible, kubectl, helm and other useful tools.

## Usage

```bash
docker run --rm -it -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" tinslice/aws-cli:debian-10-slim-tf0.13.5 bash
```

Run from bash script

```bash
#!/usr/bin/env bash
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=""

docker run --rm -it -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v $PWD:/workspace tinslice/aws-cli:debian-10-slim-tf0.13.5 bash
```