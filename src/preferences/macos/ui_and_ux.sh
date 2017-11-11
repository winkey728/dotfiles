#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../bootstrap/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   UI & UX\n\n"

    execute \
        "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
         defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
        "Avoid creating '.DS_Store' files on network or USB volumes"

    execute \
        "defaults write com.apple.CrashReporter UseUNC 1" \
        "Make crash reports appear as notifications"

    execute \
        "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
        "Automatically quit the printer app once the print jobs are completed"

    execute \
        "defaults write com.apple.screencapture disable-shadow -bool true" \
        "Disable shadow in screenshots"

    execute \
        "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
        "Save screenshots to the Desktop"

    execute \
        "defaults write com.apple.screencapture type -string 'png'" \
        "Save screenshots as PNGs"

    execute \
        "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
        "Require password immediately after into sleep or screen saver mode"

    execute \
        "defaults write -g AppleFontSmoothing -int 2" \
        "Enable subpixel font rendering on non-Apple LCDs"

    execute \
        "defaults write -g NSDisableAutomaticTermination -bool true" \
        "Disable automatic termination of inactive apps"

    execute \
        "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
        "Expand save panel by default"

    execute \
        "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'Winkey-Laptop' && \
         sudo scutil --set ComputerName 'winkey-laptop' && \
         sudo scutil --set HostName 'winkey-laptop' && \
         sudo scutil --set LocalHostName 'winkey-laptop'" \
        "Set computer name"

    execute \
        "sudo systemsetup -setrestartfreeze on" \
        "Restart automatically if the computer freezes"

    execute \
        "sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 0 && \
         sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist && \
         sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist" \
        "Turn Bluetooth off"

    killall "SystemUIServer" &> /dev/null

}

main "$@"
