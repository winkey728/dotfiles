#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../src/bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    find \
        ../test \
        ../src/bootstrap \
        ../src/installations \
        ../src/preferences \
        -type f \
        ! -path '../src/preferences/macos/*.applescript' \
        -exec shellcheck \
            -e SC1090 \
            -e SC1091 \
            -e SC1117 \
            -e SC2155 \
            -e SC2164 \
        {} +

    print_result $? "Run code through ShellCheck"

}

main
