#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Clojure\n\n"

    yaourt_install "Leiningen" "leiningen"
    yaourt_install "Boot" "boot"

}

main "$@"
