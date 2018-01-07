#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Misc Applications\n\n"

    pacman_install "Synergy" "synergy" "community"
    pacman_install "Youdao Dictionary" "youdao-dict" "archlinuxcn"

}

main "$@"
