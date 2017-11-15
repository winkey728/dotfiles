#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# ----------------------------------------------------------------------
# | Helper functions                                                   |
# ----------------------------------------------------------------------

create_directories() {

    declare -ar DIRECTORIES=(
        "$HOME/Projects/clone"
        "$Home/Projects/temp"
    )

    for d in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Create directories\n\n"

    create_directories

}

main "$@"
