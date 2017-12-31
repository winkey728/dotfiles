#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    if [ -n "$XDG_CURRENT_DESKTOP" ] && [ "${XDG_CURRENT_DESKTOP,,}" == "kde" ]; then

        print_in_purple "\n   UI\n\n"

        pacman_install "Kvantum Engine" "kvantum-qt5"
        pacman_install "Arc-KDE" "arc-kde"
        pacman_install "Papirus Icon Theme" "papirus-icon-theme"
        pacman_install "Latte Dock" "latte-dock"

    fi

}

main "$@"
