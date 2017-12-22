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

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Command Line Tools\n\n"

    pacman_install "fzf" "fzf" \
        && add_fzf_config

    pacman_install "autojump" "autojump"
    pacman_install "ripgrep" "ripgrep"
    pacman_install "fd" "fd-rs"

    pacman_install "Aria" "aria2"
    pacman_install "Aspell" "aspell"
    pacman_install "You-Get" "you-get"

}

main "$@"
