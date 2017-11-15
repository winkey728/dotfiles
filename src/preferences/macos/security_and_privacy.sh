#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Security & Privacy\n\n"

    execute \
        "sudo spctl --master-disable" \
        "Disable Gatekeeper"

}

main "$@"
