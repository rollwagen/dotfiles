#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#
# Path setup and aliases
#

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -e

# brew path addition
export PATH="/usr/local/sbin:$PATH"
# general path additions
export PATH=$PATH:~/.cargo/bin:~/bin:~/go/bin:/usr/local/go/bin:~/bin
# vmware fusion tools path
export PATH=$PATH:/Volumes/VMware\ Fusion/VMware\ Fusion.app/Contents/Library/

source ~/.alias


# Fuzzy finder config / completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alt-c for fuzzy finder
bindkey "ç" fzf-cd-widget


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

# Ripgrep
export RIPGREP_CONFIG_PATH="~/.ripgreprc"

# Color adjustments (e.g. dir listing)
export LSCOLORS=ExFxDxCxegedabagacad

# for '-?' etc to work in zsh (see https://github.com/ohmyzsh/ohmyzsh/issues/31)
unsetopt nomatch



# gco / gsw -> git checkout using fzf
# see https://github.com/cseickel/dotfiles/blob/main/zshrc#L144-L17
function fn_git_checkout() {
  branch=$(git branch --all  | fzf | sed "s/remotes\/origin\///" | xargs); git checkout $branch
}
alias gco='fn_git_checkout'
alias gsw='fn_git_checkout'

# Ctrl-U
bindkey \^U backward-kill-line


# Secretive
export SSH_AUTH_SOCK=/Users/rollwagen/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


# edit command line in $EDITOR with ctrl-x ctrl-e
export EDITOR="$(which nvim)"
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line



# source <(golangci-lint completion zsh); compdef _golangci-lint golangci-lint

# brew zsh-completion
# To activate these completions, add the following to your .zshrc:

if type brew &>/dev/null; then
  FPATH=$FPATH:$(brew --prefix)/share/zsh/site-functions
fi


PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'
export GREP_OPTIONS="--color=always"

export HISTCONTROL=ignoreboth

compinit

export GPG_TTY=$(tty)
