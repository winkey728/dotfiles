#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
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

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    brew_install "Zsh" "zsh" \
        && change_default_shell

}

main "$@"
