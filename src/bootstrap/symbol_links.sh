#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -ar FILES_TO_SYMLINK=(

    "zsh/zconf"
    "zsh/zfunc"
    "zsh/zshenv"
    "zsh/zshrc"

    "git/gitattributes"
    "git/gitconfig"
    "git/gitignore"

    "npm/npmrc"
)

# ----------------------------------------------------------------------
# | Helper functions                                                   |
# ----------------------------------------------------------------------

create_symlinks() {

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "$FILES_TO_SYMLINK"; do

        sourceFile="$(cd ../symlinks && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then

            print_success "$targetFile → $sourceFile"

        else

            if ! $skipQuestions; then

                ask_for_confirmatiom "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else

                    print_error "$targetFile → $sourceFile"

                fi

            fi

        fi

    done

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    print_in_purple "\n • Create symbolic links\n\n"

    create_symlinks "$@"

}

main "$@"
