#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Clojure\n\n"

    pacman_install "Leiningen" "leiningen" "community"
    yay_install "Boot" "boot"

}

main "$@"
