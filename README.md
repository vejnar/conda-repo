# My repo of conda packages

A [conda](https://conda.org) repo of packages to complement [conda-forge](https://conda-forge.org) and [bioconda](https://bioconda.github.io).

All [recipes](recipes) are in [v1 format](https://rattler.build/latest/reference/recipe_file/) built using [rattler-build](https://rattler.build).

## Packages

List of available [packages](recipes).

## Build repo

Packages are built within a container provided by [condaforge](https://conda-forge.org) executed using [Apptainer](https://apptainer.org).

Currently, the container employed is: [condaforge/linux-anvil-x86_64:alma8](https://hub.docker.com/r/condaforge/linux-anvil-x86_64)

### Install

Requirements are apptainer, rsync and zstd.

* For Archlinux
    ```bash
    pacman -S apptainer rsync zstd
    ```

### Create repo

*rattler-build* and *patchelf* will be downloaded in `bin/` by the `build.sh` script.

1. Build all packages
    ```bash
    ./build.sh
    ```
2. Push changes
