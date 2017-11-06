#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

rust_install() {

    execute \
        "rustup-init -y --default-toolchain stable \
                     && rustup component add rust-src" \
        "Rust (install rustc, cargo, rustup and download rust-src)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Rust\n\n"

    brew_install "rustup-init" "rustup-init" \
        && rust_install

}

main "$@"
