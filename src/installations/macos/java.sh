#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_java() {

    brew_install "Oracle Java 6" "java6"
    brew_install "Oracle Java 8" "java8"
    brew_install "Oracle Java 9" "java9"

}

install_jenv() {

    declare -r plugins=(
        "export"
    )

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install "jenv" "jenv"

    for p in $plugins; do

        execute \
            "jenv enable-plugin $p" \
            "jenv (enable plugin: $p)"

    done

}

manage_jdk_with_jenv() {

    declare -r jdkRootPath="/Library/Java/JavaVirtualMachines/"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    shopt -s nullglob
    jdks=($jdkRootPath/)
    shopt -u nullglob

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for jdk in $jdks; do

        execute \
            "jenv add '$jdkRootPath/$jdk/Content/Home'" \
            "Add $jdk to jenv"

    done

}

set_default_jdk() {

    declare -r defaultJdk="1.8"

    execute \
        "jenv global '$defaultJdk'" \
        "Jenv (set default jdk to $defaultJdk)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n Java\n\n"

    install_java

    install_jenv

    manage_jdk_with_jenv \
        && set_default_jdk

}

main "$@"
