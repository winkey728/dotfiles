#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_fzf_config() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# fzf

if command -v \"fzf\" &> /dev/null; then
   export FZF_DEFAULT_COMMAND=\"rg -uu -g '!.git' -g '!.svn' -g '!.DS_Store' --files ~\"
   export FZF_DEFAULT_OPTS=\"--inline-info\"
fi

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! file_contains_string "fzf" "$LOCAL_SHELL_CONFIG_FILE"; then

        execute \
            "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
            "fzf (update $LOCAL_SHELL_CONFIG_FILE)"

    fi

}

add_nnn_config() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# nnn

if command -v \"nnn\" &> /dev/null; then
   export DISABLE_FILE_OPEN_ON_NAV=1
fi

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! file_contains_string "nnn" "$LOCAL_SHELL_CONFIG_FILE"; then

        execute \
            "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
            "nnn (update $LOCAL_SHELL_CONFIG_FILE)"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Command Line Tools\n\n"

    brew_install "core utils" "coreutils"
    brew_install "bin utils" "binutils"
    brew_install "find utils" "findutils --with-default-names"

    brew_install "fzf" "fzf" \
        && add_fzf_config

    brew_install "autojump" "autojump"
    brew_install "ripgrep" "ripgrep"
    brew_install "fd" "fd"

    brew_install "nnn" "nnn" \
        && add_nnn_config

    brew_install "Aria2" "aria2"
    brew_install "Aspell" "aspell"
    brew_install "You-Get" "you-get"

}

main "$@"
