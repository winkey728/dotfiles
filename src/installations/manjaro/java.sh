#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"

declare -r DEFAULT_JDK="1.8"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_java() {

    pacman_install "OpenJDK 7" "jdk7-openjdk"
    pacman_install "OpenJDK 8" "jdk8-openjdk"
    pacman_install "OpenJDK 9" "jdk9-openjdk"

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

    execute \
        "git clone https://github.com/gcuisinier/jenv.git $HOME/.jenv" \
        "jenv (install)" \
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

    declare -r jdkRootPath="/usr/lib/jvm"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for jdk in $jdkRootPath/java*; do

        # simulate input confirmation to force override
        # existing jdk

        execute \
            ". $LOCAL_SHELL_CONFIG_FILE \
                && printf \"yyy\" | jenv add $jdk" \
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
