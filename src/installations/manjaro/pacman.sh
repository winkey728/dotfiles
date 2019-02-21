#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_pacman_mirrors() {

    declare -r PACMAN_MIRRORS_FILE="/etc/pacman.d/mirrorlist"
    declare -r PACMAN_MIRRORS_BACKUP="/etc/pacman.d/mirrorlist.bak"
    declare -r CONFIG="\
##
## Manjaro Linux default mirrorlist
##

## Country : China
Server = https://mirrors.ustc.edu.cn/manjaro/stable/\$repo/\$arch

## Country : China
Server = https://mirrors.huaweicloud.com/manjaro/stable/\$repo/\$arch

## Country : United States
Server = https://mirrors.ocf.berkeley.edu/manjaro/stable/\$repo/\$arch

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Backup original pacman mirrorlist file

    execute \
        "sudo cp $PACMAN_MIRRORS_FILE $PACMAN_MIRRORS_BACKUP" \
        "Backup mirrorlist"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Update pacman mirrorlist file

    execute \
        "printf '%s' '$CONFIG' | sudo tee $PACMAN_MIRRORS_FILE" \
        "Update mirrorlist"

}

add_package_repositories() {

    declare -r PACMAN_CONFIG_FILE="/etc/pacman.conf"
    declare -r CONFIGS="\
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://cdn.repo.archlinuxcn.org/\$arch

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add archlinuxcn repo server to pacman

    if ! file_contains_string "^\[archlinuxcn\]$" "$PACMAN_CONFIG_FILE"; then
        execute \
            "printf '%s' '$CONFIGS' | sudo tee -a $PACMAN_CONFIG_FILE" \
            "Pacman (add archlinuxcn repo)"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Pacman\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    change_pacman_mirrors
    add_package_repositories

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    pacman_update
    pacman_upgrade

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add archlinuxcn PGP Keys

    pacman_install "Arch Linux Chinese PGP Key" "archlinuxcn-keyring" "archlinuxcn"

}

main "$@"
