#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../bootstrap/utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"
declare -r NVM_DIRECTORY="$HOME/.nvm"
declare -r NVM_GIT_REPO_URL="https://github.com/creationix/nvm.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_npm_package() {

    local packageReadableName="$1"
    local package="$2"

    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && npm install --global --silent $package" \
        "$packageReadableName"

}

install_global_packages() {

    install_npm_package "npm (update)" "update"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_npm_package "Whistle" "whistle"
    install_npm_package "vmd (preview markdown files)" "vmd"
    install_npm_package "Tern" "tern"
    install_npm_package "Prettier" "prettier"

}

install_latest_stable_node() {

    # Install the latest stable version of Node
    # (this will also set it as the default).

    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && nvm install node" \
        "nvm (install latest Node)"

}

add_nvm_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Node Version Manager

export NVM_DIR=\"$NVM_DIRECTORY\"

[ -f \"\$NVM_DIR/nvm.sh\" ] \\
    && . \"\$NVM_DIR/nvm.sh\"

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "nvm (update $LOCAL_SHELL_CONFIG_FILE)"

}

install_nvm() {

    # Install `nvm` and add the necessary configs in the
    # local shell config file.

    execute \
        "git clone --quiet $NVM_GIT_REPO_URL $NVM_DIRECTORY \
            && cd $NVM_DIRECTORY \
            && git checkout --quiet \$(git describe --abbrev=0 --tags --match \"v[0-9]*\" origin)" \
        "nvm (install)" \
        && add_nvm_configs

}

update_nvm() {

    execute \
        "cd $NVM_DIRECTORY \
            && git fetch --quiet origin \
            && git checkout --quiet \$(git describe --abbrev=0 --tags --match \"v[0-9]*\" origin) \
            && . $NVM_DIRECTORY/nvm.sh" \
        "nvm (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n Nodejs\n\n"

    if [ ! -d "$NVM_DIRECTORY" ]; then
        install_nvm
    else
        update_nvm
    fi

    install_latest_stable_node \
        && install_global_packages

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # I first want to install yarn too, but I found it very
    # slow downloading and even failed in China. So I decide
    # to install manually.

    # brew_install "yarn" "yarn"

}

main "$@"
