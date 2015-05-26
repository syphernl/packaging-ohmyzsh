#!/bin/bash
cd usr/local/share/
git pull origin master | grep "Already up-to-date"

# If git didn't tell us we are up-to-date, we need to compile a fresh package
if [ $? -ne 0 ]; then
  cd -
  ./build.sh
fi
