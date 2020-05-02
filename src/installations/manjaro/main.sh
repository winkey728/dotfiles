#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Foundations
    ./pacman.sh
    # ./yaourt.sh
    ./yay.sh
    ./system.sh
    ./font.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Development tools

    ../zsh.sh
    ./git.sh
    ../vim.sh
    ./command_line_tools.sh
    ./java.sh
    # ./clojure.sh
    ../rust.sh
    ../python.sh
    ../nodejs.sh
    ./shell-script.sh
    ./uml.sh
    ../tmux.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Applications

    ./ui.sh
    ./gfw.sh
    ../emacs.sh
    ./input_method.sh
    ./browser.sh
    ./terminal.sh
    ./media.sh
    ./netdisk.sh
    ./vc_tool.sh
    ./sql.sh
    ./ide.sh
    ./misc_app.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./cleanup.sh

}

main "$@"
