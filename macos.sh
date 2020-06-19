
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
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Turning on log mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on

# Stealth mode (no response to ICMP ping requests, doesn't answer to connection attempts from a closed TCP or UDP port)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Allow  signed built-in applications automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on

# Disable allow signed downloaded applications automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

# Restart the process by sending a line hangup signal
sudo pkill -HUP socketfilterfw

#
# DNS - Blacklist DNS list
#
curl "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/hosts

# 
# Captive Portals - disable assistant
#
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false

#
# Miscellaneous
#

# Set screen to lock as soon as the screensaver starts:
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Expose hidden files and Library folder in Finder:
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

# Show all filename extensions (so that "Evil.jpg.app" cannot masquerade easily)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don't default to saving documents to iCloud:
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Bonjour multicast advertisements
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

