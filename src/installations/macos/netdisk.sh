#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_qshell() {

    declare -r QSHELL_URL="https://dn-devtools.qbox.me/2.1.5/qshell-darwin-x64"
    declare -r QSHELL_BIN="$HOME/bin/qshell"

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

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Network Disk Applications\n\n"

    brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Nutstore can only be installed manually, see
    # https://github.com/caskroom/homebrew-cask/blob/master/Casks/nutstore.rb

    # brew_install "Nutstore" "nutstore" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install "WizNote" "wiznote" "caskroom/cask" "cask"
    brew_install "Enpass" "enpass" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    appstore_install "itunes.apple.com/app/wunderlist/id410628904" "Wunderlist"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_qshell
}

main "$@"
