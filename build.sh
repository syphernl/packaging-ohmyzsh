#!/bin/bash
source vars.sh

echo "Building package..."
ZSH_REVISION=$(git rev-parse --short HEAD)

fpm -s dir -t deb \
--url "http://ohmyz.sh/" \
--description "A community-driven framework for managing your zsh configuration." \
--license "MIT" \
--maintainer "${PKG_MAINTAINER}" \
--vendor "${PKG_VENDOR}" \
--iteration "${UBUNTU_DIST:-trusty}_${ZSH_REVISION}" \
-d zsh \
-a all \
-n oh-my-zsh usr

mv *.deb packages/
