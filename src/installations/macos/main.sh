#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Foundations

    ./xcode.sh
    ./homebrew.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Development tools

    ../zsh.sh
    ../git.sh
    ../command_line_tools.sh
    ./java.sh
    ../rust.sh
    ../python.sh
    ../nodejs.sh
    ../shell-script.sh
    ../uml.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Applications

    ./emacs.sh
    ./browser.sh
    ./terminal.sh
    ./mail.sh
    ./gfw.sh
    ./media.sh
    ./chat.sh
    ./design.sh
    ./netdisk.sh
    ./misc_app.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./cleanup.sh

}

main "$@"
