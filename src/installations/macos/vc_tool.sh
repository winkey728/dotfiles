#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n Version Control Tools\n\n"

    brew_install "GitKraken" "gitkraken" "caskroom/cask" "cask"
    brew_install "SmartSynchronize" "smartsynchronize" "caskroom/cask" "cask"

}

main "$@"
