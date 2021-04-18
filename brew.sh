#!/usr/bin/env bash


which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    # Update to ensure using latest formulae.
    brew update
    # Upgrade the already-installed formulae.
    brew upgrade
fi


# Install an up-to-date version of Bash
# and Bash close tools.
brew install bash
brew install bash-completion2

brew install ccat
brew install dos2unix
brew install jq
brew install htop
brew install pstree
brew install openssl
brew install curl-openssl
brew install wget
brew install neovim
brew install tree
brew install watch

# Install some security/cyber/CTF tools
brew install john-jumbo
brew install nmap
brew install socat
brew install hydra
brew install cfssl
brew install hashcat
brew install radare2
brew install snort
brew install suricata
brew install telnet

brew install openvpn
brew install dnscrypt-proxy

# Install other useful binaries.
brew install git
brew install p7zip

# IaC tools
brew install packer
brew install terraform
brew install terraform-docs
brew install volatility

# Docker and Kubernetes.
brew install docker-completion
brew install helm
brew install kubernetes-cli
brew install skopeo

# Shell related
brew install zsh-syntax-highlighting
brew install fzf
brew install fd
brew install zsh-completion

# Public Clouds
brew install azure-cli


# Casks
brew cask install "iterm2"

brew cask install "alacritty"
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

brew cask install "visual-studio-code"
brew cask install "vagrant"
brew cask install "vagrant-vmware-utility"
brew cask install "powershell"

brew cask install "slack"
brew cask install "discord"

brew cask install "firefox"
brew cask install "google-chrome"
brew cask install "calibre"

#brew cask install "idafree"
brew cask install "metasploit"

brew cask install "dropbox"
brew cask install "google-backup-and-sync"
brew cask install "transmission"

brew cask install "vlc"
brew cask install "handbrake"

brew cask install "tidal"

#
# mas-cli - Mac Apple Store CLI
#
brew install mas
# Microsoft Remote Desktop
mas install 1295203466


# Remove outdated versions from the cellar.
brew analytics off
brew cleanup
brew doctor
