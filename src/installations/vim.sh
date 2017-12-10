#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {

    declare -r PLUG_LOC="$HOME/.vim/autoload/plug.vim"
    declare -r PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Download plugin manager

    execute \
        "rm -rf '$PLUG_LOC' \
            && curl -fLo '$PLUG_LOC' --create-dirs '$PLUG_URL'" \
        "Download plug.vim"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install plugins

    execute \
        "printf '\n' | vim +PlugInstall +qall" \
        "Install plugins" \
        || return 1

}

update_plugins() {

    execute \
        "vim +PlugUpdate +qall" \
        "Update plugins"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Vim\n\n"

    . "$(get_os)/vim.sh"

    install_plugins
    update_plugins

}

main "$@"
