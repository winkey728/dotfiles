#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Misc Applications\n\n"

    brew_install "Alfred" "alfred" "caskroom/cask" "cask"
    brew_install "AppZapper" "appzapper" "caskroom/cask" "cask"
    brew_install "Synergy" "synergy" "caskroom/cask" "cask"
    brew_install "SkyFonts" "skyfonts" "caskroom/cask" "cask"
    brew_install "Keypad Layout" "keypad-layout" "caskroom/cask" "cask"
    brew_install "SwitchHosts!" "switchhosts" "caskroom/cask" "cask"
    brew_install "FUSE" "osxfuse" "caskroom/cask" "cask"
    brew_install "CleanMyMac" "cleanmymac" "caskroom/cask" "cask"
    brew_install "Youdao Dictionary" "youdaodict" "caskroom/cask" "cask"

    appstore_install "itunes.apple.com/cn/app/id1127253508" "DrUnarchiver"

}

main "$@"
