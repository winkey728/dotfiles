#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Foundations
    ./pacman.sh
    ./yaourt.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Development tools

    ../zsh.sh
    ./git.sh
    ../vim.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./cleanup.sh

}

main "$@"
