#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_sogou_input_installed() {

    [ -d "/Library/Input Methods/SogouInput.app" ]

}

get_sogou_input_directory() {

    local baseDir="$(brew --prefix)/Caskroom/sogouinput"
    local version="$( \
        find "$baseDir" -maxdepth 1 ! -path "$baseDir" ! -path '*\/.*' -type d -printf "%T@ %f\n" | \
        sort -n | \
        head -1 | \
        sed "s/^[0-9]*.[0-9]* //g" \
    )"

    printf "%s/%s/%s" "$baseDir" "$version" "安装搜狗输入法.app"

}

install_sogou_input() {

    # SogouInput can only be installed manually after brew download
    # the dmg file.

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! is_sogou_input_installed; then

        open "$(get_sogou_input_directory)"

    fi

    # Wait until SogouInput is installed.

    execute \
        "until is_sogou_input_installed; do \
            sleep 5; \
         done" \
        "SogouInput.app"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
main() {

    print_in_purple "\n   Input Method\n\n"

    brew_install "SogouInput (dmg)" "sogouinput" "caskroom/cask" "cask" \
        && install_sogou_input

}

main "$@"
