#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -ar FILES_TO_SYMLINK=(
    "curl/curlrc"

    "zsh/zconf"
    "zsh/zfunc"
    "zsh/zprofile"
    "zsh/zshrc"

    "git/gitattributes"
    "git/gitconfig"
    "git/gitignore"

    "npm/npmrc"

    "iterm/iTerm"

    "vim/vim"
    "vim/vimrc"

    # "tmux/tmux"
    # "tmux/tmux.conf"

    "alacritty/alacritty.yml"
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

    for i in "${FILES_TO_SYMLINK[@]}"; do

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

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
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

create_symlink() {

    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    sourceFile="$(cd ../symlinks && pwd)/$1"
    targetFile="$2"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$targetFile" ] || $skipQuestions; then

        execute \
            "ln -fs $sourceFile $targetFile" \
            "$targetFile → $sourceFile"

    elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then

        print_success "$targetFile → $sourceFile"

    else

        if ! $skipQuestions; then

            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
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

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    print_in_purple "\n • Create symbolic links\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    create_symlinks "$@"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    create_symlink "fish/config.fish" "$HOME/.config/fish/config.fish" "$@"
    create_symlink "fish/fishfile" "$HOME/.config/fish/fishfile" "$@"

}

main "$@"
