#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Linux

if [ "$TRAVIS_OS_NAME" = "linux" ]; then

    # Install `ShellCheck`
    # (required for testing).

    sudo apt-get install -qqy shellcheck

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# OS X

elif [ "$TRAVIS_OS_NAME" = "osx" ]; then

    # Install `ShellCheck`
    # (required for testing).

    brew install shellcheck

fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# To better simulate a clean OS install, remove certain things
# included by default by Travis CI.

rm -rf "$NVM_DIR"
