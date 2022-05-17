#!/bin/bash

export YOCTO_RELEASE=kirkstone
export CHECK_LAYER_DIR=~/build
echo "Yocto Release Branch $YOCTO_RELEASE"

mkdir -p $CHECK_LAYER_DIR
git clone --branch kirkstone https://git.yoctoproject.org/git/poky 
git clone https://github.com/oci-labs/meta-opendds.git

. ~/poky/oe-init-build-env $CHECK_LAYER_DIR
~/poky/scripts/yocto-check-layer ~/meta-opendds

rm -rf $CHECK_LAYER_DIR ~/meta-opendds ~/poky

