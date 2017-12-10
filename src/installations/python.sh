#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

declare -r ZSH_ENV_FILE="$HOME/.zshenv"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

pip_install() {

    declare -r READABLE_NAME="$1"
    declare -r PACKAGE_NAME="$2"
    declare -r PIP_VERSION="$3"
    declare -r OPT="$4"

    if [ -z "$PIP_VERSION" ]; then
        PIP_VERSION="2"
    fi

    if pip"$PIP_VERSION" list --format=legacy | grep "$PACKAGE_NAME" &> /dev/null; then
        print_success "$READABLE_NAME <pip$PIP_VERSION>"
    else
        execute \
            "pip$PIP_VERSION install $OPT $PACKAGE_NAME" \
            "$READABLE_NAME <pip$PIP_VERSION>"
    fi

}

update_basic_packages() {

    declare -ar PACKAGES=(
        "pip"
        "setuptools"
    )

    for p in "${PACKAGES[@]}"; do

        pip_install "$p (update)" "$p" "2" "--upgrade"
        pip_install "$p (update)" "$p" "3" "--upgrade"

    done

}

install_global_packages() {

    declare -ar PACKAGES=(
        "isort"
        "autoflake"
    )

    for p in "${PACKAGES[@]}"; do

        pip_install "$p (install)" "$p" "3"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Python\n\n"

    . "$(get_os)/python.sh"

    update_basic_packages
    install_global_packages

}

main "$@"
