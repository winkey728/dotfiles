#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Pacman stuff

pacman_cleanup() {

    execute \
        "sudo pacman --noconfirm -Rs $(pacman -Qtdq) || true" \
        "Pacman (delete all orphaned packages)"

    execute \
        "sudo pacman --noconfirm -Sc" \
        "Pacman (clear cache)"

}

pacman_install() {

    declare -r PKG_READABLE_NAME="$1"
    declare -r PKG="$2"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if sudo pacman -Qs "$PKG" &> /dev/null; then
        print_success "$PKG_READABLE_NAME"
    else
        execute \
            "sudo pacman --noconfirm -S $PKG" \
            "$PKG_READABLE_NAME"
    fi

}

pacman_update() {

    execute \
        "sudo pacman --noconfirm -Sy" \
        "Pacman (update)"

}

pacman_upgrade() {

    execute \
        "sudo pacman --noconfirm -Syu" \
        "Pacman (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Yaourt stuff

yaourt_cleanup() {

    execute \
        "yaourt --noconfirm -Qtd || true" \
        "Yaourt (delete all orphaned packages)"

    execute \
        "yaourt --noconfirm -Sc" \
        "Yaourt (clear cache)"

}

yaourt_install() {

    declare -r PKG_READABLE_NAME="$1"
    declare -r PKG="$2"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if yaourt -Qs "$PKG" &> /dev/null; then
        print_success "$PKG_READABLE_NAME"
    else
        execute \
            "yaourt --noconfirm -S $PKG" \
            "$PKG_READABLE_NAME"
    fi

}

yaourt_update() {

    execute \
        "yaourt --noconfirm -Sy" \
        "Yaourt (update)"

}

yaourt_upgrade() {

    execute \
        "yaourt --noconfirm -Syua" \
        "Yaourt (upgrade)"

}
