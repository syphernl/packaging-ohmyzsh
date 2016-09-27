#!/bin/bash
BUILDER_IMAGE="registry.gitlab.com/syphernl/docker-builder-${UBUNTU_DIST:-trusty}:latest"
BUILD_CMDS="cd /build; ./prepare.sh; ./update.sh && ./build.sh && chown 1000:1000 packages -R"

docker run --rm --env UBUNTU_DIST="${UBUNTU_DIST:-trusty}" -v ${PWD}:/build -i -t ${BUILDER_IMAGE} bash -x -c "${BUILD_CMDS}"
