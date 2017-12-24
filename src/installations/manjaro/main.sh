#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Foundations
    ./pacman.sh
    ./yaourt.sh
    ./system.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Development tools

    ../zsh.sh
    ./git.sh
    ../vim.sh
    ./command_line_tools.sh
    ./java.sh
    ../rust.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./cleanup.sh

}

main "$@"
