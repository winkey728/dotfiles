#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare BREW_NAME="Homebrew"
declare IS_HOMEBREW=true

test "$(get_os)" == "ubuntu" \
    && declare -r BREW_NAME="Linuxbrew" \
    && declare -r IS_HOMEBREW=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_cleanup() {

    # By default Homebrew does not uninstall older versions
    # of formulas so, in order to remove them, `brew cleanup`
    # needs to be used.
    #
    # https://github.com/Homebrew/brew/blob/496fff643f352b0943095e2b96dbc5e0f565db61/share/doc/homebrew/FAQ.md#how-do-i-uninstall-old-versions-of-a-formula

    execute \
        "brew cleanup" \
        "$BREW_NNAME (cleanup)"

    if $IS_HOMEBREW; then

        execute \
            "brew cask cleanup" \
            "$BREW_NAME (cask cleanup)"

    fi

}

brew_install() {

    declare -r CMD="$4"
    declare -r FORMULA="$2"
    declare -r FORMULA_READABLE_NAME="$1"
    declare -r TAP_VALUE="$3"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Homebrew` is installed.

    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('$BREW_NAME' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If `brew tap` needs to be executed,
    # check if it executed correctly.

    if [ -n "$TAP_VALUE" ]; then
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
            return 1
        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula.

    # shellcheck disable=SC2086
    if brew $CMD list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA" \
            "$FORMULA_READABLE_NAME"
    fi

}

brew_prefix() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --prefix 2> /dev/null)"; then
        printf "%s" "$path"
        return 0
    else
        print_error "$BREW_NAME (get prebfix)"
        return 1
    fi

}

brew_tap() {

    brew tap "$1" &> /dev/null

}

brew_update() {

    execute \
        "brew update" \
        "$BREW_NAME (update)"

}

brew_upgrade() {

    execute \
        "brew upgrade" \
        "$BREW_NAME (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_app_installed() {

    [ -d "/Applications/$1.app" ]

}

appstore_install() {

    declare -r APPSTORE_URL="$1"
    declare -r APP_NAME="$2"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! is_app_installed "$APP_NAME"; then
        open "macappstores://$APPSTORE_URL"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until APP is installed.

    execute \
        "until is_app_installed '$APP_NAME'; do \
            sleep 5; \
         done" \
        "$APP_NAME.app"

}
