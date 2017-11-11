#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Language & Region\n\n"

    execute \
        "defaults write -g AppleLocale -string 'zh_CN'" \
        "Set region"

    execute \
        "defaults write -g AppleLanguages -array '(\"zh-Hans-CN\", \"en-CN\")'" \
        "Set language"

    execute \
        "defaults write -g AppleMeasurementUnits -string 'Centimeters'" \
        "Set measurement units"

    execute \
        "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
        "Disable auto-correct"

}

main "$@"
