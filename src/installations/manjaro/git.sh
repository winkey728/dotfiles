#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

make_credential() {

    declare -r GNOME_KEYRING_DIR="/usr/share/git/credential/gnome-keyring"
    declare -r HOME_BIN="$HOME/bin"


    execute \
        "sudo make --directory='$GNOME_KEYRING_DIR'" \
        "Gnome Keyring (compile)"

    execute \
        "ln -fs '$GNOME_KEYRING_DIR/git-credential-gnome-keyring' '$HOME_BIN'" \
        "Gnome Keyring (symlink)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Git\n\n"

    pacman_install "Git" "git"

    pacman_install "Gnome Keyring" "gnome-keyring"
    pacman_install "libgnome-keyring" "libgnome-keyring"

    make_credential
}

main "$@"
