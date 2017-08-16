#!/usr/bin/env bash

set -e

# Config options you may pass via Docker like so 'docker run -e "<option>=<value>"':
# - KEY=<value>

if [ -z "$WORKDIR" ]; then
  cd $WORKDIR
else
  echo "No working directory given."
  true
fi

cd /opt/workspace

#
# Build
#

platformio run

#
# Export artefacts
#

if [[ -d build ]]; then
  rm -rf build
fi
  mkdir build
fi

cd ./.pioenvs

# WARNING! Currently supports only one simultaneous
# build-environment and overwrites OUTFILE(s) with recents.

for dir in $(ls -d */); do
  echo $dir
  if [[ -d $dir ]]; then
    echo "DIR: $dir"
    pushd $dir
    if [[ -f firmware.bin ]]; then
      cp firmware.bin /opt/workspace/build/firmware.bin
    fi
    if [[ -f firmware.elf ]]; then
      cp firmware.elf /opt/workspace/build/firmware.elf
    fi
    popd
  fi
done
