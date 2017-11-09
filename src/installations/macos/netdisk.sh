#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_wunderlist() {

    if ! wunderlist_installed; then
        open "macappstores://itunes.apple.com/app/wunderlist-to-do-list-tasks/id410628904"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until `Wunderlist.app` is installed

    execute \
        "until wunderlist_installed; then \
            sleep 5; \
         done" \
        "Wunderlist.app"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Network Disks\n\n"

    brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
    brew_install "Nutstore" "nutstore" "caskroom/cask" "cask"

    brew_install "WizNote" "wiznote" "caskroom/cask" "cask"
    install_wunderlist

    brew_install "Enpass" "enpass" "caskroom/cask" "cask"

}

main "$@"
