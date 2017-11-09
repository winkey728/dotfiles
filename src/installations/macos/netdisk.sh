#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Network Disks\n\n"

    brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
    brew_install "Nutstore" "nutstore" "caskroom/cask" "cask"
    brew_install "WizNote" "wiznote" "caskroom/cask" "cask"
    brew_install "Enpass" "enpass" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    appstore_install "itunes.apple.com/app/wunderlist/id410628904" "Wunderlist"

}

main "$@"
