#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Network Disk Applications\n\n"

    pacman_install "Nutstore" "nutstore" "archlinuxcn"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    pacman_install "Evernote" "tusk" "archlinuxcn"
    pacman_install "Enpass" "enpass-bin" "archlinuxcn"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

}

main "$@"
