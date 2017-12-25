#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {

    declare -r TPM_GITHUB_URL="https://github.com/tmux-plugins/tpm.git"
    declare -r TMUX_PLUGINS_DIR="$HOME/.tmux/plugins"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ -d "$TMUX_PLUGINS_DIR/tpm" ]; then
        execute \
            "cd $TMUX_PLUGINS_DIR/tpm \
                 && git fetch --quiet origin \
                 && git checkout --quiet origin" \
            "TPM (upgrade)"
    else
        execute \
            "git clone --quiet $TPM_GITHUB_URL $TMUX_PLUGINS_DIR/tpm" \
            "TPM (install)"
    fi

    # TPM requires running tmux server, as soon as `tmux start-server` does not work
    # create dump __noop session in detached mode, and kill it when plugins are installed

    execute \
        "tmux new -d -s __noop \
             && tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH \"$TMUX_PLUGINS_DIR\" \
             && $TMUX_PLUGINS_DIR/tpm/bin/install_plugins \
             && tmux kill-session -t __noop" \
        "Install plugins"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Tmux\n\n"

    . "$(get_os)/tmux.sh"

    install_plugins

}

main "$@"
