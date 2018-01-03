#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_yaourt() {

    pacman_install "yaourt" "yaourt" "extra"
    pacman_install "fakeroot" "fakeroot" "core"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Yaourt\n\n"

    if ! cmd_exists "yaourt"; then
        install_yaourt
    fi

    yaourt_update
    yaourt_upgrade

}

main "$@"
