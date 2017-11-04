# Shorter commands for `Homebrew`.

alias brewd="brew doctor"
alias brewi="brew install"
alias brewr="brew uninstall"
alias brews="brew search"
alias brewu="brew update \
                && brew upgrade \
                && brew cleanup \
                && brew cask cleanup"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Clear DNS cache.

alias clear-dns-cache="sudo dscacheutil -flushcache; \
                       sudo killall -HUP mDNSResponder"
