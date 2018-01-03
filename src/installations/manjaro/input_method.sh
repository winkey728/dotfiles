#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Input Method\n\n"

    pacman_install "SogouInput" "fcitx-sogoupinyin" "archlinuxcn"

}

main "$@"
