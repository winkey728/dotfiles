#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Pacman\n\n"

    declare -r PACMAN_CONFIG_FILE="/etc/pacman.conf"
    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add archlinuxcn repo server to pacman

    if ! file_contains_string "archlinuxcn" "$PACMAN_CONFIG_FILE"; then
        execute \
            "printf '%s' '$CONFIGS' >> $PACMAN_CONFIG_FILE" \
            "Pacman (add archlinuxcn repo)"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    pacman_update
    pacman_upgrade

}

main "$@"
