#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    brew_install "Python 2" "python"
    brew_install "Python 3" "python3"
    brew_install "Pipenv" "pipenv"

}

main "$@"
