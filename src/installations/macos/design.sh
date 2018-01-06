#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Design Applications\n\n"

    # brew_install "Sketch APP" "sketch" "caskroom/cask" "cask"
    brew_install "Sketchpacks" "sketchpacks" "caskroom/cask" "cask"

}

main "$@"
