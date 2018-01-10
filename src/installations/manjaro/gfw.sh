#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r PROXYCHAINS_CONFIG_FILE="/etc/proxychains.conf"

declare -r DEFAULT_SOCKS5_HOST="127.0.0.1"
declare -r DEFAULT_SOCKS5_PORT="1080"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

setup_genpac() {

    declare -r PAC_DIR="$HOME/.shadowsocks"
    declare -r PAC_FILE="$PAC_DIR/autoproxy.pac"
    declare -r USER_RULE_FILE="$PAC_DIR/user-rule.txt"
    declare -r USER_RULE_CONFIG="\
! Put user rules line by line in this file.
! See https://adblockplus.org/en/filter-cheatsheet

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    mkd "$PAC_DIR"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! [ -e "$USER_RULE_FILE" ]; then

        execute \
            "printf '%s' '$USER_RULE_CONFIG' >> $USER_RULE_FILE" \
            "Create user-rule.txt"

    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "sudo genpac --format=pac --pac-proxy='SOCKS5 $DEFAULT_SOCKS5_HOST:$DEFAULT_SOCKS5_PORT' \
              --gfwlist-url='https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt' \
              --user-rule-from='$USER_RULE_FILE' -o='$PAC_FILE'" \
        "Generate PAC file"

}

set_proxychains_config() {

    declare -r CONFIG="

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shadowsocks proxy
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

    pacman_install "Shadowsocks-qt5" "shadowsocks-qt5" "community" \
        && setup_genpac

    pacman_install "proxychains-ng" "proxychains-ng" "community" \
        && set_proxychains_config

}

main "$@"
