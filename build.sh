#!/bin/bash

set -e
set -u

HUGO_RELEASE=$1
image_name=whereismytaco/hugo
tag=${image_name}:${HUGO_RELEASE}

docker build -t ${tag} --build-arg HUGO_RELEASE=${HUGO_RELEASE} .
docker push ${image_name}
