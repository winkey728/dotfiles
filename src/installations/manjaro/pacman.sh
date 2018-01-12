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
Server = https://cdn.repo.archlinuxcn.org/$arch

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add archlinuxcn repo server to pacman

    if ! file_contains_string "^\[archlinuxcn\]$" "$PACMAN_CONFIG_FILE"; then
        execute \
            "printf '%s' '$CONFIGS' | sudo tee -a $PACMAN_CONFIG_FILE" \
            "Pacman (add archlinuxcn repo)"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    pacman_update
    pacman_upgrade

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add archlinuxcn PGP Keys

    pacman_install "Arch Linux Chinese PGP Key" "archlinuxcn-keyring" "archlinuxcn"

}

main "$@"
