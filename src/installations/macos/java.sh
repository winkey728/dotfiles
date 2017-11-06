#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -ar JAVA6=("1.6" "java6" "Oracle Java 6")
declare -ar JAVA8=("1.8" "java8" "Oracle Java 8")
declare -ar JAVA9=("1.9" "java9" "Oracle Java 9")

declare -r DEFAULT_JDK="${JAVA8[0]}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_java() {

    brew_install "${JAVA6[1]}" "${JAVA6[2]}"
    brew_install "${JAVA8[1]}" "${JAVA8[2]}"
    brew_install "${JAVA9[1]}" "${JAVA9[2]}"

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

    execute \
        "jenv global '$DEFAULT_JDK'" \
        "Jenv (set default jdk to $DEFAULT_JDK)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n Java\n\n"

    install_java

    install_jenv \
        && manage_jdk_with_jenv \
        && set_default_jdk

}

main "$@"
