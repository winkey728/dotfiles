#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n Chat\n\n"

    brew_install "QQ" "qq" "caskroom/cask" "cask"

    appstore_install "itunes.apple.com/cn/app/wechat/id836500024" "WeChat"

}

main "$@"
