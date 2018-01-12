#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Fonts\n\n"

    pacman_install "Source Code Pro" "adobe-source-code-pro-fonts" "extra"
    pacman_install "Roboto" "ttf-roboto" "community"

}

main "$@"
