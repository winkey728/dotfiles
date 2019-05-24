#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r OMZ_DIRECTORY="$HOME/.oh-my-zsh"
declare -r OMZ_GIT_REPO_URL="https://github.com/robbyrussell/oh-my-zsh.git"

declare -r POWERLEVEL10K_THEME_DIRECTORY="$OMZ_DIRECTORY/custom/themes/powerlevel10k"
declare -r POWERLEVEL10K_THEME_GIT_REPO_URL="https://github.com/romkatv/powerlevel10k.git"

declare -r ZSH_AS_DIRECOTRY="$OMZ_DIRECTORY/custom/plugins/zsh-autosuggestions"
declare -r ZSH_AS_GIT_REPO_URL="https://github.com/zsh-users/zsh-autosuggestions.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

clone_omz() {

    local dir="$1"
    local url="$2"

    execute \
        "git clone --quiet $url $dir" \
        "Oh My Zsh (install to $dir)"

}

update_omz() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin master" \
        "Oh My Zsh (update in $dir)"

}

install_omz() {

    if [ ! -d "$OMZ_DIRECTORY" ]; then

        clone_omz "$OMZ_DIRECTORY" "$OMZ_GIT_REPO_URL"

    else

        update_omz "$OMZ_DIRECTORY"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

clone_theme() {

    local dir="$1"
    local url="$2"

    execute \
        "git clone --quiet $url $dir" \
        "powerlevel10k theme (install to $dir)"

}

update_theme() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin master" \
        "powerlevel10k theme (update in $dir)"

}

install_theme() {

    if [ ! -d "$POWERLEVEL10K_THEME_DIRECTORY" ]; then

        clone_theme "$POWERLEVEL10K_THEME_DIRECTORY" "$POWERLEVEL10K_THEME_GIT_REPO_URL"

    else

        update_theme "$POWERLEVEL10K_THEME_DIRECTORY"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

clone_zsh_as() {

    local dir="$1"
    local url="$2"

    execute \
        "git clone --quiet $url $dir" \
        "zsh-autosuggestions (install to $dir)"

}

update_zsh_as() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin master" \
        "zsh-auttosuggestions (update in $dir)"

}

install_autosuggestions() {

    if [ ! -d "$ZSH_AS_DIRECOTRY" ]; then

        clone_zsh_as "$ZSH_AS_DIRECOTRY" "$ZSH_AS_GIT_REPO_URL"

    else

        update_zsh_as "$ZSH_AS_DIRECOTRY"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Zsh\n\n"

    . "$(get_os)/zsh.sh"

    install_omz \
        && install_theme \
        && install_autosuggestions

}

main "$@"
