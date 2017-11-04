#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_default_shell() {

    local newShellPath=""
    local brewPrefix=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brewPrefix="$(brew_prefix)" \
        || return 1

    newShellPath="$brewPrefix/bin/zsh"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add the path of the `Bash` version installed through `Homebrew`
    # to the list of login shells from the `/etc/shells` file.
    #
    # This needs to be done because applications use this file to
    # determine whether a shell is valid (e.g.: `chsh` consults the
    # `/etc/shells` to determine whether an unprivileged user may
    # change the login shell for her own account).
    #
    # http://www.linuxfromscratch.org/blfs/view/7.4/postlfs/etcshells.html

    if ! grep "$newShellPath" < /etc/shells &> /dev/null; then
        execute \
            "printf '%s\n' '$newShellPath' | sudo tee -a /etc/shells" \
            "Bash (add '$newShellPath' in '/etc/shells')" \
            || return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Set brew version of `Zsh` as the default

    chsh -s "$newShellPath" &> /dev/null
    print_result $? "Zsh (use brew version)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

clone_omz() {

    local dir="$1"
    local url="$2"

    execute \
        "git clone --quiet $url $dir" \
        "Oh My Zsh (install to '$dir')"

}

update_omz() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin master" \
        "Oh My Zsh (upgrade in '$dir')"

}

install_omz() {

    declare -r OMZ_DIRECTORY="$HOME/.oh-my-zsh"
    declare -r OMZ_GIT_REPO_URL="https://github.com/robbyrussell/oh-my-zsh.git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -d "$OMZ_DIRECTORY" ]; then

        clone_omz "$OMZ_DIRECTORY" "$OMZ_GIT_REPO_URL"

    else

        update_omz "$OMZ_DIRECTORY"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

clone_zsh_as() {

    local dir="$1"
    local url="$2"

    execute \
        "git clone --quiet $url $dir" \
        "zsh-autosuggestions (install to '$dir')"

}

update_zsh_as() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin master" \
        "zsh-auttosuggestions (upgrade to '$dir')"

}

install_autosuggestions() {

    declare -r ZSH_AS_DIRECOTRY="$OMZ_DIRECTORY/custom/plugins/zsh-autosuggestions"
    declare -r ZSH_AS_GIT_REPO_URL="https://github.com/zsh-users/zsh-autosuggestions.git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -d "$ZSH_AS_DIRECOTRY" ]; then

        clone_zsh_as "$ZSH_AS_DIRECOTRY" "$ZSH_AS_GIT_REPO_URL"

    else

        update_zsh_as "$ZSH_AS_DIRECOTRY"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Zsh\n\n"

    brew_install "Zsh" "zsh" \
        && change_default_shell

    install_omz \
        && install_autosuggestions

}

main "$@"
