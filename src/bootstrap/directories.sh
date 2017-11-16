#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# ----------------------------------------------------------------------
# | Helper functions                                                   |
# ----------------------------------------------------------------------

create_directories() {

    declare -ar DIRECTORIES=(
        "$HOME/Projects/clone"
        "$HOME/Projects/temp"
    )

    for d in "${DIRECTORIES[@]}"; do
        mkd "$d"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Create directories\n\n"

    create_directories

}

main "$@"
