#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Google Chrome\n\n"

    execute \
        "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
        "Disable backswipe"

    killall "Google Chrome" &> /dev/null

}

main "$@"
