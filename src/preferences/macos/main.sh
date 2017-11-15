#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Close any open `System Preferences` panes in order to
    # avoid overriding the preferences that are being changed.

    ./close_system_preferences_panes.applescript

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./security_and_privacy.sh
    ./appstore.sh
    ./dock.sh
    ./language_and_region.sh
    ./ui_and_ux.sh

    ./finder.sh
    ./photos.sh
    ./textedit.sh
    ./safari.sh
    ./chrome.sh
    ./terminal.sh

}

main "$@"
