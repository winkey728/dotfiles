#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r DEFAULT_TOOLCHAIN="stable"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    brew_install "Rustup-init" "rustup-init"

    execute \
        "rustup-init -y --default-toolchain $DEFAULT_TOOLCHAIN" \
        "Toolchain (rustc, cargo, rustup)"

}

main "$@"
