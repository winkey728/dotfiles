#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    brew_install "Python 2" "python@2"
    brew_install "Python 3" "python"
    brew_install "Pipenv" "pipenv"

}

main "$@"
