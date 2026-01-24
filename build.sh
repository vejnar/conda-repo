#!/bin/bash

set -e

mkdir -p bin

# Get rattler-build
if [ ! -f "bin/rattler-build" ] ; then
  wget --timestamping -O bin/rattler-build https://github.com/prefix-dev/rattler-build/releases/latest/download/rattler-build-x86_64-unknown-linux-musl
  chmod +x bin/rattler-build
fi

# Get patchelf
if [ ! -f "bin/patchelf" ] ; then
  wget --timestamping https://github.com/NixOS/patchelf/releases/download/0.18.0/patchelf-0.18.0-x86_64.tar.gz
  tar xvfz patchelf-0.18.0-x86_64.tar.gz ./bin/patchelf
  rm -f patchelf-0.18.0-x86_64.tar.gz
fi

apptainer exec \
  --bind ./bin/rattler-build:/usr/bin/rattler-build \
  --bind ./bin/patchelf:/usr/bin/patchelf \
  docker://condaforge/linux-anvil-x86_64:alma8 \
  rattler-build build \
    --recipe-dir recipes \
    --skip-existing=all \
    --package-format conda:19 \
    --output-dir build

zstd -19 --force build/*/repodata.json
rsync -vaP build/linux-64 build/noarch channel/
