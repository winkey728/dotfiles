#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Terminal\n\n"

    execute \
        "defaults write com.googlecode.iterm2 PrefsCustomFolder -string '$HOME/.iTerm/'" \
        "Set preferences custom folder for iTerm"

    execute \
        "defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true" \
        "Load preferences from custom folder for iTerm"

    killall "iTerm" &> /dev/null

}

main "$@"
