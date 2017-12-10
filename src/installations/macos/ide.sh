#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   IDEs\n\n"

    brew_install "Jetbrains Toolbox" "jetbrains-toolbox" "caskroom/cask" "cask"

}

main "$@"
