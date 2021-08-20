#!/usr/bin/env bash


if [ ! -f "/usr/local/bin/brew" ] ; then
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
brew install wireshark
brew install yara

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
brew install bettercap
brew install hex-fiend

brew install openvpn
brew install dnscrypt-proxy

# Install other useful binaries.
brew install git
brew install github
brew install gh
brew install p7zip

# IaC tools
brew install packer
brew install terraform
brew install terrascan
brew install terraform-docs
brew install volatility

# Docker and Kubernetes.
brew install docker-completion
brew install helm
brew install kubernetes-cli
brew install skopeo
brew install k9s
brew install k3d
brew install trivy

# Shell related
brew install mosh
brew install tmux
brew install shellcheck
brew install zsh-syntax-highlighting
brew install fzf
brew install fd
brew install zsh-completion
brew install zsh-completions
brew install tldr
brew install glow
brew install ripgrep
brew install lsd
brew install bat
brew install colordiff
brew install curl

# Public Clouds
brew install azure-cli
brew install google-cloud-sdk
brew install awscli
brew install aws-elasticbeanstalk
brew install aws-sam-cli

brew install basictex
brew install hackintool
brew install knockknock
brew install pandoc
brew install sqlectron
brew install sqlite
brew install openjdk

# Python
brew install pyenv
brew install pipx

# Casks
brew install "eul"
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
brew install "zoom"

brew install "firefox"
brew install "google-chrome"
brew install "calibre"

#brew install "idafree"
brew install "metasploit"

brew install "dropbox"
brew install "google-backup-and-sync"
brew install "transmission"
brew install --cask "transmission"

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
