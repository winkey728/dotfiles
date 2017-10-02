# Java
if [ -f $HOME/.jenv/bin/jenv ]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
    eval "$(jenv init -)"
fi

# Ruby
if [ -f $HOME/.rvm/bin/rvm ]; then
    export RVM_PATH="$HOME/.rvm"
    export PATH="$PATH:$RVM_PATH/bin" # Add RVM to PATH for scripting
fi

# Python
if [ -f $HOME/.pyenv/bin/pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    if [ -f $HOME/.pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenv ]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# NodeJS
if [ -f $HOME/.nvm/nvm.sh ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# Rust
if [ -x "$(command -v rustc)" ]; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi
