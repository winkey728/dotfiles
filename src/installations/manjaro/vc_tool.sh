#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Version Control Applications\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # All packages here need root permission to export them to
    # `/var/cache/pacman/pkg`

    ask_for_sudo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    yaourt_install "GitKraken" "gitkraken"
    yaourt_install "SmartSynchronize" "smartsynchronize"

}

main "$@@"
