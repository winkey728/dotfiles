#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   IDEs\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install "Jetbrains Toolbox" "jetbrains-toolbox" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Editors

    brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"
    brew_install "Typora" "typora" "caskroom/cask" "cask"

}

main "$@"
