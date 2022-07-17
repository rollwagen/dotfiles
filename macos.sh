
#
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# OSX for pentesting:
#	https://gist.github.com/gabemarshall/33f1944e198b1b5ca878
#
# Security hardening check:
#     https://github.com/CISOfy/lynis
#     https://github.com/kristovatlas/osx-config-check
#


# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponderHelper.plist

#--N-E-W-----------------------------------------------

################################################################# #
# Guide to securing and improving privacy on macOS                #
# https://github.com/drduh/macOS-Security-and-Privacy-Guide       #
################################################################# #

#
# Firewall: Application layer firewall
#

# Enable Firewall
echo "Enable Firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Turning on log mode
echo "Turning on log mode..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on

# Stealth mode (no response to ICMP ping requests, doesn't answer to connection attempts from a closed TCP or UDP port)
echo "Turning on stealth mode..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Allow  signed built-in applications automatically
echo "Allow signed built-in applications automatically (firewall) ..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on

# Disable allow signed downloaded applications automatically
echo "Disable allow signed downloaded applications automatically (firewall) ..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

# Restart the process by sending a line hangup signal
echo "Restarting socketfilter firewall..."
sudo pkill -HUP socketfilterfw

#
# DNS - Blacklist DNS list
#
echo "Adding blacklist to /etc/hosts ..."
curl --silent "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/hosts 1>/dev/null

#
# Captive Portals - disable assistant
#
echo "Disable Captive Portals assistant..."
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false

#
# Miscellaneous
#

# Set screen to lock as soon as the screensaver starts:
echo "Set screen to lock as soon as the screensaver starts..."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Expose hidden files and Library folder in Finder:
echo "Expose hidden files and Library folder in Finder..."
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

# Show all filename extensions (so that "Evil.jpg.app" cannot masquerade easily)
echo "Show all filename extensions (so that \"Evil.jpg.app\" cannot masquerade easily) ..."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don't default to saving documents to iCloud:
echo "Don't default to saving documents to iCloud..."
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Bonjour multicast advertisements
echo "Disable Bonjour multicast advertisements..."
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES



################################################################# #
# Pentesting setup preferences from                               #
# https://gist.github.com/gabemarshall/33f1944e198b1b5ca878       #
################################################################# #

# "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

# "Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# "Showing status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

# "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# C I S

#2.1.3 Show Bluetooth status in menu bar (Scored)
# defaults read com.apple.systemuiserver menuExtras | grep Bluetooth.menu

# Disable Remote Apple Events (Scored)
sudo systemsetup -setremoteappleevents off

# 2.4.5 Disable Remote Login (Scored)
sudo systemsetup -setremotelogin off

# 2.4.8 Disable File Sharing (Scored)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist 2>/dev/null
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist 2>/dev/null

# 2.5.2 Enable Gatekeeper (Scored)
sudo spctl --master-enable

# 2.5.3 - 2.5.4 Firewall...see above

# 2.5.6 Enable Location Services (Not Scored) - Disable !
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.locationd.plist

# 2.12 Disable "Wake for network access" and "Power Nap" (Scored)
sudo pmset -a womp 0
sudo pmset -a powernap 0

# 3.6 Ensure Firewall is configured to log (Scored)...see above

# 4.1 Disable Bonjour advertising service (Scored)
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true

# 4.2 Enable "Show Wi-Fi status in menu bar" (Scored)
open /System/Library/CoreServices/Menu\ Extras/AirPort.menu

# 4.4 Ensure http server is not running (Scored)
sudo apachectl stop 2>/dev/null

# 4.5 Ensure nfs server is not running (Scored)
sudo nfsd disable 2>/dev/null

# 5.1.1 Secure Home Folders (Scored) (orig:  sudo chmod -R og-rwx /Users/<username>)
sudo chmod  og-rw /Users/[a-z]*

# 5.8 Disable automatic login (Scored)
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser 2>/dev/null



##################################################################
# Guide to Securing macOS 10.12
# https://csrc.nist.gov/CSRC/media/Publications/sp/800-179/rev-1/draft/documents/sp800-179r1-draft.pdf
##################################################################

# J.4. Hide users list
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool true

# J.10. Wireless networking - Disable AirDrop
defaults write ~/Library/Preferences/com.apple.NetworkBrowser.plist DisableAirDrop -bool true

# J.13. Privacy

# Disable sending of diagnostic data to Apple
HW_UUID=$(system_profiler SPHardwareDataType 2> /dev/null | grep 'Hardware UUID' | awk ' { print $3 }')
defaults write ~/Library/Preferences/ByHost/com.apple.SubmitDiagInfo."$HW_UUID".plist AutoSubmit -bool false

# Disable Siri
defaults write ~/Library/Preferences/com.apple.assistant.support.plist "Assistant Enabled" -int 0

# Disable lookup suggestions
defaults write ~/Library/Preferences/com.apple/lookup.shared.plist LookupSuggestionsDisabled -int 1
defaults write com.apple.spotlight orderedItems -array \
        '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
        '{"enabled" = 0;"name" = "MENU_OTHER";}' \
        '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
        '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
        '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
        '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'


# Disable animations when opening and closing windows.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Accelerated playback when adjusting the window size.
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
