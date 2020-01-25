#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r PROXYCHAINS_CONFIG_FILE="/etc/proxychains.conf"

declare -r DEFAULT_SOCKS5_HOST="127.0.0.1"
declare -r DEFAULT_SOCKS5_PORT="1080"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_proxychains_config() {

    declare -r CONFIG="

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# SOCKS proxy
socks5 $DEFAULT_SOCKS5_HOST $DEFAULT_SOCKS5_PORT

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    if ! file_contains_string "^socks5 $DEFAULT_SOCKS5_HOST $DEFAULT_SOCKS5_PORT" "$PROXYCHAINS_CONFIG_FILE"; then

        execute \
            "printf '%s' '$CONFIG' | sudo tee -a $PROXYCHAINS_CONFIG_FILE" \
            "proxychains-ng (update config)"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   GFW Applications\n\n"

    pacman_install "v2ray" "v2ray" "community"
    pacman_install "v2ray-geoip" "v2ray-geoip" "community"
    pacman_install "v2ray-domain-list-community" \
                   "v2ray-domain-list-community" \
                   "community"
    pacman_install "qv2ray" "qv2ray" "archlinuxcn"

    pacman_install "proxychains-ng" "proxychains-ng" "community" \
        && set_proxychains_config

}

main "$@"
