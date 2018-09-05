#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   SQL Applications\n\n"

    brew_install "SQL Tabs" "sql-tabs" "caskroom/cask" "cask"

}

main "$@"
