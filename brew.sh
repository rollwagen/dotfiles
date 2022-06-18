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
brew install 'bash'
brew install bash-completion@2

brew install ccat
brew install dos2unix
brew install jq
brew install htop
brew install pstree
brew install openssl
brew install curl
brew install wget
brew install tree
brew install watch
brew install wireshark

CTF tools
brew install john-jumbo
brew install nmap
brew install socat
brew install hydra
brew install cfssl
brew install gpg-suite
brew install hashcat
brew install radare2
brew install snort
# brew install suricata
brew install telnet
brew install bettercap
brew install hex-fiend
brew install volatility
brew install burp-suite
brew install owasp-zap
brew install recon-ng
brew install yara

brew install openvpn
brew install dnscrypt-proxy

# Install other useful binaries.
brew install git
brew install git-delta
brew install github
brew install git-secrets
brew install gh
brew install p7zip
brew install direnv

# Neovim
brew install neovim
brew install vim
brew install vale
brew install tree-sitter

# IaC tools
brew install packer

# Terraform
brew install terraform
brew install terraform-docs
brew install tflint
brew install terraform-ls
brew install tfenv

# IaC / Public cloud / AWS security
brew install terrascan
brew install tfsec
brew install cfn-lint
brew install checkov
brew install cloudaplaining
brew install steampipe
brew install cloudformation-guard
brew install regula
brew install semgrep
brew install snyk


# Linter, checkers etc
brew install markdownlint-cli
brew install yamllint
brew install hadolint  # Dockerfile

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
brew install less
brew install colordiff
brew install curl

brew install node
brew install yarn

# Public Clouds
brew install azure-cli
brew install google-cloud-sdk
brew install awscli
brew install aws-elasticbeanstalk
brew install aws-sam-cli
brew install aws-vault
brew install cloud-nuke

brew install basictex
brew install hackintool
brew install knockknock
brew install pandoc
# brew install sqlectron
brew install sqlite
brew install openjdk

# K8s
brew install kubernetes-cli
brew install kube-linter
brew install yq

# Python
brew install pyenv
brew install pipx
brew install pyright
brew install yapf

# Go
brew install go
brew install golangci-lint
brew install gopls

# Casks
brew install "eul"
brew install "iterm2"
brew install "alacritty"
brew tap homebrew/cask-fonts
brew install fontconfig
brew install font-fira-code-nerd-font
brew install font-hack-nerd-font
brew install font-jetbrains-mono-nerd-font
brew install font-ubuntu-nerd-font font-ubuntu-mono-nerd-font

brew install "visual-studio-code"
brew install "vagrant"
brew install "vagrant-vmware-utility"
brew install "powershell"

brew install "slack"
brew install "discord"
brew install "zoom"

brew install "firefox"
brew install "google-chrome"
brew install "brave-browser"
brew install "calibre"

brew install yubico-yubikey-manager

#brew install "idafree"
#brew install "metasploit"

brew install dropbox
# brew install google-backup-and-sync
brew install transmission-cli
brew install --cask transmission

brew install vlc
brew install handbrake

# brew install tidal


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
