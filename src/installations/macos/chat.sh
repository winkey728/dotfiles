#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

wechat_installed() {

    [ -d "/Applications/WeChat.app" ]

}

install_wechat() {

    if ! wechat_installed; then
        open "macappstores://itunes.apple.com/cn/app/wechat/id836500024"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until `WeChat` is installed.

    execute \
        "until wechat_installed; do \
            sleep 5; \
         done" \
        "WeChat.app"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n Chat\n\n"

    brew_install "QQ" "qq" "caskroom/cask" "cask"

    install_wechat

}
