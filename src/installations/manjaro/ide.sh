#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   IDEs\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    yaourt_install "Jetbrains Toolbox" "jetbrains-toolbox"

}

main "$@"