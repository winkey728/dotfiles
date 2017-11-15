#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r PROXYCHAINS_CONFIG_FILE="/usr/local/etc/proxychains.conf"

declare -r DEFAULT_SOCKS5_HOST="127.0.0.1"
declare -r DEFAULT_SOCKS5_PORT="1086"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_proxychains_config() {

    declare -r CONFIG="

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shadowsocks proxy
socks5 $DEFAULT_SOCKS5_HOST $DEFAULT_SOCKS5_PORT

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    if ! file_contains_string "socks5" "$PROXYCHAINS_CONFIG_FILE"; then

        execute \
            "printf '%s' '$CONFIG' >> $PROXYCHAINS_CONFIG_FILE" \
            "proxychains-ng (update config)"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   GFW Applications\n\n"

    brew_install "ShadowsocksX-NG" "shadowsocksx-ng" "caskroom/cask" "cask"

    brew_install "proxychains-ng" "proxychains-ng" \
        && set_proxychains_config

}

main "$@"
