#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Misc APPs"

    brew_install "Alfred" "alfred" "caskroom/cask" "cask"
    brew_install "AppZapper" "appzapper" "caskroom/cask" "cask"
    brew_install "Synergy" "synergy" "caskroom/cask" "cask"
    brew_install "SkyFonts" "skyfonts" "caskroom/cask" "cask"
    brew_install "Keypad Layout" "keypad-layout" "caskroom/cask" "cask"
    brew_install "SwitchHosts!" "switchhosts" "caskroom/cask" "cask"
    brew_install "OnyX" "onyx" "caskroom/cask" "cask"
    brew_install "FUSE" "osxfuse" "caskroom/cask" "cask"

}

main "$@"