#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Dock\n\n"

    execute \
        "defaults write com.apple.dock autohide -bool true" \
        "Automatically hide/show the Dock"

    execute \
        "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
        "Enable spring loading for all Dock items"

    execute \
        "defaults write com.apple.dock expose-group-by-app -bool false" \
        "Do not group windows by application in Mission Control"

    execute \
        "defaults write com.apple.dock mineffect -string 'suck'" \
        "Change minimize/maximize window effect"

    execute \
        "defaults write com.apple.dock minimize-to-application -bool true" \
        "Reduce clutter by minimizing windows into their application icons"

    execute \
        "defaults write com.apple.dock mru-spaces -bool false" \
        "Do not automatically rearrange spaces based on most recent use"

    execute \
        "defaults write com.apple.dock show-process-indicators -bool true" \
        "Show indicator lights for open applications"

    execute \
        "defaults write com.apple.dock showhidden -bool true" \
        "Make icons of hidden applications translucent"

    execute \
        "defaults write com.apple.dock tilesize -int 32" \
        "Set default icon size"

    execute \
        "defaults write com.apple.dock magnification -bool true" \
        "Enable magnification"

    execute \
        "defaults write com.apple.dock largesize -int 72" \
        "Set large icon size"

    killall "Dock" &> /dev/null

}

main "$@"
