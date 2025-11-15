#!/bin/bash

set -e

rattler-build build --recipe-dir recipes --skip-existing=all --package-format conda:19 --output-dir build
zstd -19 --force build/*/repodata.json
rsync -vaP build/linux-64 build/noarch repo/
