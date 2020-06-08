#!/usr/bin/env bash

# Update to ensure using latest formulae.
brew update

# Upgrade the already-installed formulae.
brew upgrade

# Install an up-to-date version of Bash
# and Bash close tools.
brew install bash
brew install bash-completion2

brew install ccat
brew install dos2unix
brew install jq
brew install htop
brew install pstree
brew install curl-openssl
brew install wget

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
#TODO shell completions + include in bashrc/zshrc  
# $(brew --prefix)/opt/fzf/install
# export FZF_DEFAULT_COMMAND='fd --type f --exclude "/Library/" --exclude "/Music/"'
# export FZF_CTRL_T_COMMAND='fd --type f --exclude "Library/" --exclude "Music/"'
# export FZF_ALT_C_COMMAND='fd --type d --exclude "Library/" --exclude "Music/"'
brew install fd

# Casks
brew cask install "iterm2"
brew cask install "visual-studio-code"
brew cask install "vagrant"
brew cask install "vagrant-vmware-utility"
brew cask install "powershell"

brew cask install "slack"
brew cask install "discord"

brew cask install "firefox"
brew cask install "google-chrome"
brew cask install "calibre"

brew cask install "idafree"
brew cask install "metasploit"

brew cask install "dropbox"
brew cask install "google-backup-and-sync"
brew cask install "transmission"

brew cask install "vlc"
brew cask install "handbrake"

brew cask install "tidal"


# Remove outdated versions from the cellar.
brew cleanup
