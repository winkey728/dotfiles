#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Misc Applications\n\n"

    brew_install "Alfred" "alfred" "caskroom/cask" "cask"
    brew_install "AppCleaner" "appcleaner" "caskroom/cask" "cask"
    brew_install "Synergy" "synergy" "caskroom/cask" "cask"
    brew_install "Rectangle" "rectangle" "caskroom/cask" "cask"
    # brew_install "FUSE" "osxfuse" "caskroom/cask" "cask"
    brew_install "Tuxera" "tuxera-ntfs" "caskroom/cask" "cask"
    brew_install "Youdao Dictionary" "youdaodict" "caskroom/cask" "cask"
    brew_install "Keka" "keka" "caskroom/cask" "cask"
    brew_install "Mos" "mos" "caskroom/cask" "cask"
    brew_install "Itsycal" "itsycal" "caskroom/cask" "cask"

    brew_install "富途牛牛" "futuniuniu" "caskroom/cask" "cask"

}

main "$@"
