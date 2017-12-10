#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Media Applicatons\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    appstore_install "itunes.apple.com/cn/app/QQLive/id1231336508" "QQLive"
    appstore_install "itunes.apple.com/cn/app/%E7%88%B1%E5%A5%87%E8%89%BA/id1012296988" "爱奇艺"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    brew_install "MPV" "mpv" "caskroom/cask" "cask"
    brew_install "IINA" "iina" "caskroom/cask" "cask"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    brew_install "Netease Music" "neteasemusic" "caskroom/cask" "cask"

}

main "$@"
