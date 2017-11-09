alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd..="cd .."
alias gh="cd ~"

alias path='printf "%b\n" "${PATH//:/\\n}"'
alias rma="rm -rf --"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Java

alias javahome='printf "%b\n" "$JAVA_HOME"'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# NPM

alias npmv="npm -v"
alias npml="npm list --depth=0"
alias npmlg="npm list -g --depth=0"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Proxychains-NG

alias pc4="proxychains4 -q"
