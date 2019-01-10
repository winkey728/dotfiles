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
    export NNN_SHOW_HIDDEN=1
    export NNN_COPIER=\"/tmp/n3cp\"
    export NNN_TMPFILE=\"/tmp/nnn\"

    n3() {

        if ! [ -f \$NNN_COPIER ]; then
            echo \"#!/usr/bin/env sh\n\ncat ~/.nnncp | xargs -0 | xsel -bi\" > \$NNN_COPIER
            chmod +x \$NNN_COPIER
        fi

        nnn \"\$@\"

        if [ -f \$NNN_TMPFILE ]; then
            . \$NNN_TMPFILE
            rm -f \$NNN_TMPFILE > /dev/null
        fi

        if [ -f \$NNN_COPIER ]; then
            rm -f \$NNN_COPIER > /dev/null
        fi

    }
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

    pacman_install "xsel" "xsel" "community"

    pacman_install "fzf" "fzf" "community" \
        && add_fzf_config

    pacman_install "autojump" "autojump" "community"
    pacman_install "ripgrep" "ripgrep" "community"
    pacman_install "fd" "fd" "community"

    pacman_install "nnn" "nnn" "community" \
        && add_nnn_config

    pacman_install "Aria" "aria2" "community"
    pacman_install "Aspell" "aspell" "extra"
    pacman_install "You-Get" "you-get" "community"

}

main "$@"
