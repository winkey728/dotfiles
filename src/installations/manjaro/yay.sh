#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_yay() {

    pacman_install "yay" "yay" "community"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Yay\n\n"

    if ! cmd_exists "yay"; then
        install_yay
    fi

    yay_upgrade

}

main "$@"
