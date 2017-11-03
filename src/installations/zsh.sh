#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_default_shell() {

    local zshPath="$(which zsh)"
    sudo sh -c "echo $zshPath >> /etc/shells"
    chsh -s $zshPath

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Zsh\n\n"

    brew_install "Zsh" "zsh"
    change_default_shell

}

main "$@"
