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

# Initial java and jenv

if [ -f $HOME/.jenv/bin/jenv ]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
    eval "$(jenv init -)"
elif command -v jenv > /dev/null 2>&1; then
    if [ -d /usr/local/opt/jenv ]; then
        export JENV_ROOT="/usr/local/opt/jenv"
    fi
    eval "$(jenv init -)"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Initial ruby and rvm

if [ -f $HOME/.rvm/bin/rvm ]; then
    export RVM_PATH="$HOME/.rvm"
    export PATH="$RVM_PATH/bin:$PATH" # Add RVM to PATH for scripting
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Initial python and pyenv

if [ -f $HOME/.pyenv/bin/pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    [ -s $HOME/.pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenv ] && eval "$(pyenv virtualenv-init -)"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Initial rust and rustup

if [ -f $HOME/.cargo/bin/rustc ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Initial autojump

if [ -f "$(brew --prefix)/etc/profile.d/autojump.sh" ]; then
    . "$(brew --prefix)/etc/profile.d/autojump.sh"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Initial fzf

if [ -x "$(command -v fzf)" ]; then
    export FZF_DEFAULT_COMMAND="rg -uu -g '!.git' -g '!.svn' -g '!.DS_Store' --files ~"
    export FZF_DEFAULT_OPTS="--inline-info"
fi
