#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Version Control Applications\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    yay_install "SmartSynchronize" "smartsynchronize"

}

main "$@"
