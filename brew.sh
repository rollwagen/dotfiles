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
brew install "iterm2"
brew install "alacritty"
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

brew install "visual-studio-code"
brew install "vagrant"
brew install "vagrant-vmware-utility"
brew install "powershell"

brew install "slack"
brew install "discord"

brew install "firefox"
brew install "google-chrome"
brew install "calibre"

#brew install "idafree"
brew install "metasploit"

brew install "dropbox"
brew install "google-backup-and-sync"
brew install "transmission"

brew install "vlc"
brew install "handbrake"

brew install "tidal"

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
