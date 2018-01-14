#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r CONFIG_FILE="kioslaverc"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Proxy\n\n"

    execute \
        "kwriteconfig5 --file $CONFIG_FILE \
                      --group 'Proxy Settings' \
                      --key 'Proxy Config Script' \
                      --type string \
                      $HOME/.shadowsocks/autoproxy.pac" \
        "Set proxy config script"

    execute \
        "kwriteconfig5 --file $CONFIG_FILE \
                      --group 'Proxy Settings' \
                      --key ProxyType \
                      --type int \
                      2" \
        "Set proxy type"

}

main "$@"
