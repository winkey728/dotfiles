#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Email Applications\n\n"

    brew_install "Netease MailMaster" "mailmaster" "caskroom/cask" "cask"

}

main "$@"
