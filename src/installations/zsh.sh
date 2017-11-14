#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r OMZ_DIRECTORY="$HOME/.oh-my-zsh"
declare -r OMZ_GIT_REPO_URL="https://github.com/robbyrussell/oh-my-zsh.git"

declare -r ZSH_AS_DIRECOTRY="$OMZ_DIRECTORY/custom/plugins/zsh-autosuggestions"
declare -r ZSH_AS_GIT_REPO_URL="https://github.com/zsh-users/zsh-autosuggestions.git"

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

    if ! file_contains_string "$newShellPath" "/etc/shells"; then
        execute \
            "printf '%s\n' '$newShellPath' | sudo tee -a /etc/shells" \
            "Zsh (add '$newShellPath' in '/etc/shells')" \
            || return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Set brew version of `Zsh` as the default

    chsh -s "$newShellPath" &> /dev/null
    print_result $? "Zsh (use brew version)"

}

disable_path_helper() {

    # Remove the path of the macOS added through `path_helper`, which
    # those path are defined in `/etc/paths`.
    #
    # This needs to be done because some applications use their own
    # PATH to run but the system PATH, which contain the same command,
    # appear before their own PATH, thus leading to conflict (e.g.:
    # `jenv` run the java command located in `$JENV_ROOT/shims/java`,
    # however, `/usr/local/bin` also contains java).
    #
    # This conflit is because I export the PATH in the `zshenv` file,
    # which sourced before the `/etc/zprofile`. And the `/etc/zprofile`
    # will call the path_helper command to add the PATH defined in
    # `/etc/paths` and `/etc/paths.d/*`
    #
    # https://stackoverflow.com/questions/26520584/why-is-my-path-much-longer-than-bash-profile
    # https://stackoverflow.com/questions/9832770/where-is-the-default-terminal-path-located-on-mac
    # https://github.com/rbenv/rbenv/wiki/Unix-shell-initialization

    if [[ -s /etc/paths ]]; then
        execute \
            "sudo mv /etc/paths /etc/paths.bak \
                  && printf '' | sudo tee -a /etc/paths" \
            "Diable path_helper (only macOS)"
    fi

}

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
        "Oh My Zsh (upgrade in $dir)"

}

install_omz() {

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
        "zsh-autosuggestions (install to $dir)"

}

update_zsh_as() {

    local dir="$1"

    execute \
        "cd $dir \
            && git pull --quiet --rebase origin master" \
        "zsh-auttosuggestions (upgrade in $dir)"

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

    brew_install "Zsh" "zsh" \
        && change_default_shell \
        && disable_path_helper

    install_omz \
        && install_autosuggestions

}

main "$@"
