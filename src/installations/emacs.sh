#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r SPACEMACS_REPO="winkey728/spacemacs"
declare -r SPACEMACS_GIT_URL="https://github.com/$SPACEMACS_REPO.git"

declare -r MY_CONFIG_REPO="winkey728/spacemacs.d"
declare -r MY_CONFIG_GIT_URL="https://github.com/$MY_CONFIG_REPO.git"

declare -r EMACS_DOT_D_DIRECTORY="$HOME/.emacs.d"
declare -r SPACEMACS_DOT_D_DIRECTORY="$HOME/.spacemacs.d"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_spacemacs() {

    local dir="$1"
    local url="$2"

    execute \
        "git clone --quiet $url $dir" \
        "emacs.d (install to $dir)"

}

update_spacemacs() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin develop" \
        "emacs.d (upgrade in $dir)"

}

setup_spacemacs() {

    if [ ! -d "$EMACS_DOT_D_DIRECTORY" ]; then

        install_spacemacs "$EMACS_DOT_D_DIRECTORY" "$SPACEMACS_GIT_URL"

    else

        update_spacemacs "$EMACS_DOT_D_DIRECTORY"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_my_config() {

    local dir="$1"
    local url="$2"

    execute \
        "git clone --quiet $url $dir" \
        "My emacs config (install to $dir)"

}

update_my_config() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin master" \
        "My emacs config (update in $dir)"

}

setup_my_config() {

    if [ ! -d "$SPACEMACS_DOT_D_DIRECTORY" ]; then

        install_my_config "$SPACEMACS_DOT_D_DIRECTORY" "$MY_CONFIG_GIT_URL"

    else

        update_my_config "$SPACEMACS_DOT_D_DIRECTORY"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Emacs\n\n"

    . "$(get_os)/emacs.sh"

    setup_spacemacs
    setup_my_config

}

main "$@"
