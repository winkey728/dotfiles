#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -ar PYTHON_VERIONS=(
    "3.6.3"
    "2.7.14"
)

declare -r DEFAULT_PYTHON="${PYTHON_VERIONS[0]}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_python() {

    for py in "${PYTHON_VERIONS[@]}"; do

        if ! (pyenv versions | grep "$py" &> /dev/null); then

            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

            # Use openssl library installed by Homebrew/Linuxbrew
            # https://github.com/pyenv/pyenv/wiki/Common-build-problems#error-the-python-ssl-extension-was-not-compiled-missing-the-openssl-lib

            execute \
                "CFLAGS=\"-I\$(brew --prefix openssl)/include\" \
                    LDFLAGS=\"-L\$(brew --prefix openssl)/lib\" \
                    pyenv install -v $py" \
                "Python (install $py)"

        fi

    done

}

set_default_python() {

    execute \
        "pyenv global $DEFAULT_PYTHON" \
        "Setup default python version ($DEFAULT_PYTHON)"

}

install_global_packages() {

    declare -ar GLOBAL_PACKAGES=(
        "isort"
        "autoflake"
    )

    for p in "${GLOBAL_PACKAGES[@]}"; do

        execute \
            "pip install $p" \
            "Install package $p"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Python\n\n"

    brew_install "pyenv" "pyenv" \
        && install_python \
        && set_default_python \
        && install_global_packages

    brew_install "pipenv" "pipenv"

}

main "$@"
