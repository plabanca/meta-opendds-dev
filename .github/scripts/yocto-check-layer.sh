#!/bin/bash

export YOCTO_RELEASE=kirkstone
echo "Yocto Release Branch $YOCTO_RELEASE"
echo "Temp Dir: $RUNNER_TEMP"
echo "Workspace: $GITHUB_WORKSPACE"
cd $RUNNER_TEMP
git clone --depth 1 --branch $YOCTO_RELEASE https://git.yoctoproject.org/git/poky 
. ./poky/oe-init-build-env build
yocto-check-layer --with-software-layer-signature-check --debug "$GITHUB_WORKSPACE"
