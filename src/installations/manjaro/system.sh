#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   System\n\n"

    pacman_install "Kernel (version 4.14)" "linux414"
    pacman_install "Kernel headers (version 4.14)" "linux414-headers"

}

main "$@"
