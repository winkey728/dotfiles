#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Clojure\n\n"

    brew_install "Leiningen" "leiningen"
    brew_install "Boot" "boot-clj"

}

main "$@"
