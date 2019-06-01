#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Fonts\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Normal fonts

    pacman_install "Source Code Pro" "adobe-source-code-pro-fonts" "extra"
    pacman_install "Roboto" "ttf-roboto" "community"
    pacman_install "文泉驿微米黑" "wqy-microhei" "community"
    pacman_install "文泉驿正黑" "wqy-zenhei" "community"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Iconic fonts

    yaourt_install "Source Code Pro (Nerd Complete)" "nerd-fonts-source-code-pro"

}

main "$@"
