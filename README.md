# My repo of conda packages

A [conda](https://conda.org) repo of packages to complement [conda-forge](https://conda-forge.org) and [bioconda](https://bioconda.github.io).

All [recipes](recipes) are in [v1 format](https://rattler.build/latest/reference/recipe_file/) built using [rattler-build](https://rattler.build).

## Packages

List of available [packages](recipes).

## Build repo

### Install

Requirements are [rattler-build](https://rattler.build), [GitHub CLI](https://cli.github.com) and [jq](https://jqlang.github.io/jq)
    * For Archlinux
        ```bash
        pacman -S rattler-build patchelf gh jq
        ```

### Create repo

1. Build all packages
    ```bash
    ./build.sh
    ```
2. Push changes
