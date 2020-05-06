
#
# https://github.com/drduh/macOS-Security-and-Privacy-Guide
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# OSX for pentesting:
#	https://gist.github.com/gabemarshall/33f1944e198b1b5ca878
#
# Security hardening check:
#     https://github.com/CISOfy/lynis
#     https://github.com/kristovatlas/osx-config-check
# 

# Fetch the latest version of this file: https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
# Project home page: https://github.com/StevenBlack/hosts
# Project releases: https://github.com/StevenBlack/hosts/releases
# https://github.com/drduh/macOS-Security-and-Privacy-Guide#dns
curl "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/hosts

# https://github.com/drduh/macOS-Security-and-Privacy-Guide#captive-portal
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# Expose hidden files and Library folder in Finder:
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

# Show all filename extensions (so that "Evil.jpg.app" cannot masquerade easily)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable Bonjour multicast advertisements
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponderHelper.plist

