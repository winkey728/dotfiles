#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"

declare -ar JAVA6=("1.6" "java6" "Oracle Java 6" "caskroom/versions")
declare -ar JAVA8=("1.8" "java8" "Oracle Java 8" "caskroom/versions")
declare -ar LATEST_JAVA=("" "java" "Latest Oracle Java" "caskroom/cask")

declare -r DEFAULT_JDK="${JAVA8[0]}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_java() {

    brew_install "${JAVA6[2]}" "${JAVA6[1]}" "${JAVA6[3]}" "cask"
    brew_install "${JAVA8[2]}" "${JAVA8[1]}" "${JAVA8[3]}" "cask"
    brew_install "${LATEST_JAVA[2]}" "${LATEST_JAVA[1]}" "${LATEST_JAVA[3]}" "cask"

}

add_jenv_config() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# jenv

if [ -f \"\$HOME/.jenv/bin/jenv\" ]; then
    export PATH=\"\$HOME/.jenv/bin:\$PATH\"
    export CLASSPATH=\".:\$JAVA_HOME/lib:\$JAVA_HOME/jre/lib:\$CLASSPATH\"
    eval \"\$(jenv init -)\"
elif command -v jenv &> /dev/null; then
    if [[ -d /usr/local/opt/jenv ]]; then
        export JENV_ROOT=\"/usr/local/opt/jenv\"
    fi
    eval \"\$(jenv init -)\"
fi

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! file_contains_string "jenv" "$LOCAL_SHELL_CONFIG_FILE"; then

        execute \
            "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
            "jenv (update $LOCAL_SHELL_CONFIG_FILE)"

    fi

}

install_jenv() {

    declare -r plugins=(
        "export"
    )

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install "jenv" "jenv" \
        && add_jenv_config \
            || return 1

    for p in $plugins; do

        execute \
            ". $LOCAL_SHELL_CONFIG_FILE \
                && jenv enable-plugin $p" \
            "jenv (enable plugin: $p)"

    done

}

manage_jdk_with_jenv() {

    declare -r jdkRootPath="/Library/Java/JavaVirtualMachines"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for jdk in $jdkRootPath/*; do

        # simulate input confirmation to force override
        # existing jdk

        execute \
            ". $LOCAL_SHELL_CONFIG_FILE \
                && printf \"yyy\" | jenv add $jdk/Contents/Home" \
            "jenv (add $jdk to jenv)"

    done

}

set_default_jdk() {

    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && jenv global $DEFAULT_JDK" \
        "Jenv (set default jdk to $DEFAULT_JDK)"

}



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Java\n\n"

    install_java

    install_jenv \
        && manage_jdk_with_jenv \
        && set_default_jdk

}

main "$@"
