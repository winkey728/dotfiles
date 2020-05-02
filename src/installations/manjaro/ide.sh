#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   IDEs\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    yay_install "Jetbrains Toolbox" "jetbrains-toolbox"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Editors

    pacman_install "Visual Studio Code" "visual-studio-code-bin" "archlinuxcn"
    pacman_install "Typora" "typora" "archlinuxcn"

}

main "$@"
