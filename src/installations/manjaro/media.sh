#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Media Applications\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    pacman_install "VLC" "vlc-nightly" "community"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    pacman_install "Netease Music" "netease-cloud-music" "archlinuxcn"

}

main "$@"
