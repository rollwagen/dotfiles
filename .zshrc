# ################################ #
#      oh-my-zsh config.           #
# ################################ #

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Manually load git plugin (without oh-my-zsh)
# source $ZSH/lib/git.zsh
# source $ZSH/plugins/git/git.plugin.zsh

# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="agitnoster"

plugins=(zsh-autosuggestions) # (git docker docker-compose)

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source $ZSH/oh-my-zsh.sh
fi

# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# ################################ #
#      END oh-my-zsh config.       #
# ################################ #


#
# Lines configured by zsh-newuser-install
#
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall


#
# brew zsh-completion
#
# To activate these completions, add the following to your .zshrc:

  if type brew &>/dev/null; then
    FPATH=$FPATH:$(brew --prefix)/share/zsh/site-functions

    autoload -Uz compinit
    compinit
  fi

# You may also need to force rebuild `zcompdump`:
#   rm -f ~/.zcompdump; compinit
# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:
#   chmod go-w '/usr/local/share'


# Activate zsh syntax highlighting (pre-req package 'zsh-syntax-highlighting')
# MacOS
ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE=/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE" ] && source "$ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE"
# Ubuntu / Debian
ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE" ] && source "$ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE"


# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
#  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# kubectl autocomplete - see  https://kubernetes.io/docs/reference/kubectl/cheatsheet/
if  type "kubectl" >/dev/null ; then
  source <(kubectl completion zsh)
fi


# iTerm2 shell integration
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh

# Ctrl-U
bindkey \^U backward-kill-line

#
# PATH setup
#

# brew path addition
export PATH="/usr/local/sbin:$PATH"
# general path additions
export PATH=$PATH:~/.cargo/bin:~/bin:~/go/bin:/usr/local/go/bin:~/bin
# vmware fusion tools path
export PATH=$PATH:/Volumes/VMware\ Fusion/VMware\ Fusion.app/Contents/Library/


# Fuzzy finder config / completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alt-c for fuzzy finder
bindkey "ç" fzf-cd-widget

# Azure auto completion
autoload bashcompinit && bashcompinit
[ -f /usr/local/etc/bash_completion.d/az ] && source /usr/local/etc/bash_completion.d/az


# FZF_ALT_C_COMMAND (orig:  fd --type d --exclude "Library/" --exclude "Music/")
# - follow also symlinks
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export FZF_DEFAULT_COMMAND='fdfind --type f --exclude "/Library/" --exclude "/Music/"'
  export FZF_CTRL_T_COMMAND='fdfind --type f --exclude "Library/" --exclude "Music/"'
  export FZF_ALT_C_COMMAND='fdfind --follow --type d --exclude "Library/" --exclude "Music/"'
else
  export FZF_DEFAULT_COMMAND='fd --type f --exclude "/Library/" --exclude "/Music/"'
  export FZF_CTRL_T_COMMAND='fd --type f --exclude "Library/" --exclude "Music/"'
  export FZF_ALT_C_COMMAND='fd --follow --type d --exclude "Library/" --exclude "Music/"'
fi


# Color adjustments (e.g. dir listing)
export LSCOLORS=ExFxDxCxegedabagacad

# for '-?' etc to work in zsh (see https://github.com/ohmyzsh/ohmyzsh/issues/31)
unsetopt nomatch


# Google Cloud SDK
GCSDK_PATH_ZSH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
GCSDK_COMPL_ZSH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
[ -f $GCSDK_PATH_ZSH ] && source $GCSDK_PATH_ZSH
[ -f $GCSDK_COMPL_ZSH ] && source $GCSDK_COMPL_ZSH

# AWS CLI command completion
[ -f /usr/local/bin/aws_completer ] && complete -C '/usr/local/bin/aws_completer' aws
[ -f /usr/bin/aws_completer ] && complete -C '/usr/bin/aws_completer' aws
[ -f /usr/local/aws-cli/v2/current/bin/aws_completer ] && complete -C '/usr/local/aws-cli/v2/current/bin/aws_completer' aws
[ -f /opt/homebrew/bin/aws_completer ] && complete -C '/opt/homebrew/bin/aws_completer' aws

if type "brew" > /dev/null; then
  eval "$(brew shellenv)"
fi

# Alacritty not available via brew on Apple Silicon
[ -f ~/.cargo/bin/alacritty ] && alias alacritty=~/.cargo/bin/alacritty

# Python / pyenv specifics `eval "$(pyenv virtualenv-init -)"`
if type "pyenv" > /dev/null; then
  eval "$(pyenv init --path)"
fi
[ -d ~/.local/bin ] && export PATH=$PATH:~/.local/bin

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform


# gco -> git checkout using fzf
# see https://github.com/cseickel/dotfiles/blob/main/zshrc#L144-L17
function fn_git_checkout() {
  branch=$(git branch --all  | fzf | sed "s/remotes\/origin\///" | xargs); git checkout $branch
}
alias gco='fn_git_checkout'


eval "$(/opt/homebrew/bin/brew shellenv)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Import aliases
source ~/.alias # eval "$(cat ~/.alias)"

# Secretive
# export SSH_AUTH_SOCK=/Users/rollwagen/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# echo 'export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"'

eval "$(starship init zsh)"

source <(golangci-lint completion zsh); compdef _golangci-lint golangci-lint
export PYENV_ROOT="/Users/rollwagen/.pyenv"; export PATH="$PYENV_ROOT/bin:$PATH"; eval "$(pyenv init -)"

eval "$(zoxide init zsh)"
