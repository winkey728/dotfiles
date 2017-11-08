# Zsh exports

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make `vim` the default editor.

export VISUAL=vim
export EDITOR=$VISUAL

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Enable colored output from ls, etc.

export CLICOLOR=true

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

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Initial python and pyenv

if [ -f $HOME/.pyenv/bin/pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    [ -s $HOME/.pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenv ] && eval "$(pyenv virtualenv-init -)"
fi
