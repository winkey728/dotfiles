#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"

declare -r DEFAULT_JDK="1.8"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_java() {

    pacman_install "OpenJDK 7" "jdk7-openjdk" "extra"
    pacman_install "OpenJDK 8" "jdk8-openjdk" "extra"
    pacman_install "OpenJDK 9" "jdk9-openjdk" "extra"

}

add_jenv_config() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# jenv

if [ -f \"\$HOME/.jenv/bin/jenv\" ]; then
    export PATH=\"\$HOME/.jenv/bin:\$PATH\"
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

    declare -r dir="$HOME/.jenv"

    declare -ar plugins=(
        # "lein"
        "export"
    )

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ -d "$dir" ]; then

        # Update

        execute \
            "cd $dir \
                && git pull --quiet --rebase origin master" \
            "jenv (update)"

    else

        # Install

        execute \
            "git clone --quiet https://github.com/gcuisinier/jenv.git $dir" \
            "jenv (install)" \
            && add_jenv_config \
                || return 1

    fi

    for p in "${plugins[@]}"; do

        execute \
            ". $LOCAL_SHELL_CONFIG_FILE \
                && jenv enable-plugin $p" \
            "jenv (enable plugin: $p)"

    done

}

manage_jdk_with_jenv() {

    declare -r jdkRootPath="/usr/lib/jvm"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for jdk in "$jdkRootPath"/java*; do

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
