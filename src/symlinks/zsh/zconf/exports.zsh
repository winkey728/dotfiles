# Zsh exports

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make `vim` the default editor.

export VISUAL=vim
export EDITOR=$VISUAL

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Enable colored output from ls, etc.

export CLICOLOR=true

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Prefer ZH Chinese and use UTF-8 encoding.

export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Add useful bin directories to PATH if nessesary

push_path() {

    local pathToAdd="$1"

    [[ ":$PATH:" != *":$pathToAdd:"* ]] && PATH="$pathToAdd:$PATH"

}

push_path "/sbin"
push_path "/usr/sbin"
push_path "/bin"
push_path "/usr/bin"
push_path "/usr/local/sbin"
push_path "/usr/local/bin"
push_path "$HOME/bin"

export PATH

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Initial linuxbrew

if [ -d $HOME/.linuxbrew ]; then
    export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
elif [ -d /home/linuxbrew/.linuxbrew ]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
fi
