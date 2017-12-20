#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# ----------------------------------------------------------------------
# | Helper functions                                                   |
# ----------------------------------------------------------------------

create_directories() {

    declare -ar DIRECTORIES=(
        "$HOME/bin"
        "$HOME/Projects/clone"
        "$HOME/Projects/temp"

        "$HOME/Projects/qiniu"
        "$HOME/Projects/qiniu/runtime/log"
        "$HOME/Documents/qiniu"
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
