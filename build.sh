#!/bin/bash
source vars.sh

echo "Cleanup old.."
rm *.deb

git pull origin master | grep "Already up-to-date"

# If git didn't tell us we are up-to-date, we need to compile a fresh package
if [ $? -ne 0 ]; then
  echo "Building package..."
  ZSH_REVISION=$(git rev-parse --short HEAD)

  cd -
  fpm -s dir -t deb \
  --url "http://ohmyz.sh/" \
  --description "A community-driven framework for managing your zsh configuration." \
  --license "MIT" \
  --maintainer "$PKG_MAINTAINER" \
  --vendor "$PKG_VENDOR" \
  --iteration "$ZSH_REVISION" \
  -d zsh \
  -a all \
  -n oh-my-zsh usr
fi
