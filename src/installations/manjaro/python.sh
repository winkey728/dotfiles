#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare PIP_NEED_SUDO=true

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    pacman_install "Python 2" "python2" "extra"
    pacman_install "Pip 2" "python2-pip" "extra"
    pacman_install "Python 3" "python" "extra"
    pacman_install "Pip 3" "python-pip" "extra"
    yaourt_install "Pipenv" "python-pipenv" "community"

}

main "$@"
