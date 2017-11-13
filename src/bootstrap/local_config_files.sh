#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# ----------------------------------------------------------------------
# | Helper functions                                                   |
# ----------------------------------------------------------------------

create_zsh_local() {

    declare -r FILE_PATH="$HOME/.zsh.local"

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        printf "" >> "$FILE_PATH"

    fi

    print_result $? "$FILE_PATH"

}

create_gitconfig_local() {

    declare -r FILE_PATH="$HOME/.gitconfig.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local gitUser=""
    local gitEmail=""
    local credential=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        skip_questions "$@" && skipQuestions=true

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        if ! $skipQuestions; then

            ask "Please provide your git username: "
            gitUser="$(get_answer)"

            ask "Please provide your git email: "
            gitEmail="$(get_answer)"

        fi

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        credential="$(get_git_credential)" \
            || return 1

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        printf "%s\n" \
"[commit]

    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    # gpgsign = true

[diff]

    # You can use any diff tool here(e.g. Meld)

    # tool = meld

[merge]

    # You can use any merge tool here(e.g. Meld)

    # tool = meld

[user]

    name = $gitUser
    email = $gitEmail
    # signingkey =

[credential]

    helper = $credential" \
        >> "$FILE_PATH"
   fi

    print_result $? "$FILE_PATH"

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    print_in_purple "\n • Create local config files\n\n"


    create_gitconfig_local "$@"
    create_zsh_local "$@"

}

main "$@"
