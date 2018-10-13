#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_qshell() {

    declare -r QSHELL_URL="https://dn-devtools.qbox.me/2.1.5/qshell-linux-x64"
    declare -r QSHELL_BIN="$HOME/Projects/qiniu/qshell"
    declare -r DEST_BIN="$HOME/bin/qshell"

    if command -v "curl" &> /dev/null; then

        execute \
            "curl -LsSo ${QSHELL_BIN} ${QSHELL_URL}" \
            "qshell"

    elif command -v "wget" &> /dev/null; then

        execute \
            "wget -qO ${QSHELL_BIN} ${QSHELL_URL}" \
            "qshell"

    fi

    chmod +x "${QSHELL_BIN}"

    ln -fs "${QSHELL_BIN}" "${DEST_BIN}"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Network Disk Applications\n\n"

    pacman_install "Nutstore" "nutstore" "archlinuxcn"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    yaourt_install "Evernote" "tusk"
    yaourt_install "Enpass" "enpass-bin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    install_qshell

}

main "$@"
