#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Fonts\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Normal fonts

    brew_install "Fira Code" "font-fira-code" "homebrew/cask-fonts" "cask"
    brew_install "Cascadia" "font-cascadia" "homebrew/cask-fonts" "cask"
    brew_install "Source Code Pro" "font-source-code-pro" "homebrew/cask-fonts" "cask"
    brew_install "Roboto" "font-roboto" "homebrew/cask-fonts" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Iconic fonts

    brew_install "Fira Code (Nerd Font)" "font-firacode-nerd-font" "homebrew/cask-fonts" "cask"
    brew_install "Cascadia (Nerd Font)" "font-caskaydiacove-nerd-font" "homebrew/cask-fonts" "cask"
    brew_install "Source Code Pro (Nerd Font)" "font-sourcecodepro-nerd-font" "homebrew/cask-fonts" "cask"

}

main "$@"
