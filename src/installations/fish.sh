#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r FISHER_LOCATION="$HOME/.config/fish/functions/fisher.fish"
declare -r FISHER_DOWNLOAD_URL="https://git.io/fisher"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

download_fisher() {

    local dir="$1"
    local url="$2"

    execute \
        "curl $url --create-dirs -sLo $dir" \
        "Fisher (download to $dir)"

}

update_fisher() {

    execute \
        "fish -c fisher self-update" \
        "Fisher (update itself)"

}

install_fisher() {

    if [ -f "$FISHER_LOCATION" ]; then
        update_fisher
    else
        download_fisher "$FISHER_LOCATION" "$FISHER_DOWNLOAD_URL"
    fi

}

install_or_update_fish_packages() {

    execute \
        "fish -c fisher" \
        "Fisher (install or update packages)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Fish\n\n"

    . "$(get_os)/fish.sh"

    install_fisher &&
        install_or_update_fish_packages

}

main "$@"
