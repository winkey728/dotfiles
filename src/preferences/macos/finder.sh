#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Finder\n\n"

    execute \
        "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
        "Use full POSIX path as window title"

    execute \
        "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
        "Disable warning when changing a file extension"

    execute \
        "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
        "Use list view in all Finder windows by default"

    execute \
        "defaults write com.apple.finder NewWindowTarget -string 'PfHm' && \
         defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/'" \
        "Set 'Home' as the default location for new Finder windows"

    execute \
        "defaults write com.apple.finder ShowRecentTags -bool false" \
        "Do not show recent tags"

    execute \
        "defaults write -g AppleShowAllExtensions -bool true" \
        "Show all filename extensions"

    execute \
        "defaults write com.apple.finder AppleShowAllFiles -bool true" \
        "Show hidden files"

    execute \
        "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
        "Avoid creating .DS_Store files on network volumes"

    execute \
        "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist" \
        "Set icon size"

    execute \
        "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist" \
        "Set icon grid spacing size"

    execute \
        "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist" \
        "Set icon label text size"

    execute \
        "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
        "Set icon label position"

    execute \
        "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:showItemInfo true' ~/Library/Preferences/com.apple.finder.plist" \
        "Show item info"

    execute \
        "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist" \
        "Set sort method"

    killall "Finder" &> /dev/null

    # Starting with Mac OS X Mavericks preferences are cached,
    # so in order for things to get properly set using `PlistBuddy`,
    # the `cfprefsd` process also needs to be killed.
    #
    # https://github.com/alrra/dotfiles/commit/035dda057ddc6013ba21db3d2c30eeb51ba8f200

    killall "cfprefsd" &> /dev/null

}

main "$@"
