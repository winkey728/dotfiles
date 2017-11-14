#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# ----------------------------------------------------------------------
# | Helper Function                                                    |
# ----------------------------------------------------------------------

has_github_certificate() {

    if printf "protocol=https\nhost=github.com\n\n" \
            | git $credential get \
       &> /dev/null; then

        return 0

    else

        return 1

    fi

}

set_github_certificate() {

    local username=""
    local password=""
    local credential=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    credential="$(get_github_certificate)" \
        || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask "Please provide your Github username: "
    username="$(get_answer)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_password "Please provide your Github password"
    password="$(get_answer)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "protocol=https\nhost=github.com\nusername=$username\npassword=$password\n\n" \
        | git credential-$credential store \
        &> /dev/null

    print_result "$?" "Store the github credential"

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    if ! get_github_certificate; then

        set_github_certificate \
            || return 1

    fi

    print_in_purple "\n • Update content\n\n"

    ask_for_confirmation "Do you want to update the content from the 'dotfiles' directory?"

    if answer_is_yes; then

        git fetch --all 1> /dev/null \
            && git reset --hard origin/master 1> /dev/null \
            && git clean -fd 1> /dev/null

        print_result $? "Update content"

    fi

}