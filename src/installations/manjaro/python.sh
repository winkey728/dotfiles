#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare PIP_NEED_SUDO=true

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    pacman_install "Python 2" "python2"
    pacman_install "Pip 2" "python2-pip"
    pacman_install "Python 3" "python"
    pacman_install "Pip 3" "python-pip"
    yaourt_install "Pipenv" "python-pipenv"

}

main "$@"
