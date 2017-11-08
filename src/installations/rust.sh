#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"

declare -r DEFAULT_TOOLCHAIN="stable"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

rust_install() {

    execute \
        "rustup-init -y --default-toolchain $DEFAULT_TOOLCHAIN \
                     && rustup component add rust-src" \
        "Rust (install rustc, cargo, rustup and download rust-src)"

}

add_rust_config() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Rust

if [ -x \"\$HOME/.cargo/bin/rustc\" ]; then
    export PATH=\"\$HOME/.cargo/bin:\$PATH\"
    export RUST_SRC_PATH=\"\$(rustc --print sysroot)/lib/rustlib/src/rust/src\"
fi

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "Rust (update $LOCAL_SHELL_CONFIG_FILE)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Rust\n\n"

    brew_install "rustup-init" "rustup-init" \
        && rust_install \
        && add_rust_config

}

main "$@"
