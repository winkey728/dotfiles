#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r DEFAULT_TOOLCHAIN="stable"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    pacman_install "Rustup" "rustup" "community"

    execute \
        "rustup toolchain install $DEFAULT_TOOLCHAIN \
            && rustup default $DEFAULT_TOOLCHAIN" \
        "Toolchain (rustc, cargo)"

}

main "$@"
