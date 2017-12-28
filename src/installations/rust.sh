#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"
declare -r ZFUNC_DIR="$HOME/.zfunc"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_rust_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Rust

if [ -x \"\$HOME/.cargo/bin/rustc\" ]; then
    export PATH=\"\$HOME/.cargo/bin:\$PATH\"
fi
export RUST_SRC_PATH=\"\$(rustc --print sysroot)/lib/rustlib/src/rust/src\"

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "Rust (update $LOCAL_SHELL_CONFIG_FILE)"

}

add_rustup_completion() {

    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && rustup completions zsh > $ZFUNC_DIR/_rustup" \
        "Rustup (completion)"

}

download_source_code() {

    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && rustup component add rust-src" \
        "Rust (download source code)"

}

do_update() {

    execute \
        "rustup update" \
        "Rustup (update all)"

}

do_install() {

    . "$(get_os)/rust.sh"

    add_rust_configs

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Rust\n\n"

    if cmd_exists "rustup"; then
        do_update
    else
        do_install
    fi

    add_rustup_completion
    download_source_code

}

main "$@"
