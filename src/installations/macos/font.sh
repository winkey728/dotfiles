#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Fonts\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Normal fonts

    brew_install "Source Code Pro" "font-source-code-pro" "caskroom/fonts" "cask"
    brew_install "Roboto" "font-roboto" "caskroom/fonts" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Iconic fonts

    brew_install "Source Code Pro (Nerd Complete)" "font-sourcecodepro-nerd-font" "caskroom/fonts" "cask"

}

main "$@"
