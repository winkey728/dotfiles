#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Command Line Tools\n\n"

    brew_install "autojump" "autojump"
    brew_install "fd" "fd"
    brew_install "fzf" "fzf"
    brew_install "ripgrep" "ripgrep"

    brew_install "Aria2" "aria2"
    brew_install "Aspell" "aspell"
    brew_install "You-Get" "you-get"

}

main "$@"
