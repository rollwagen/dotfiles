

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
zstyle :compinstall filename '/Users/rollwagen/.zshrc'
#autoload -Uz compinit
#compinit
# End of lines added by compinstall


#
# brew zsh-completion
#
#To activate these completions, add the following to your .zshrc:

  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    compinit
  fi

#You may also need to force rebuild `zcompdump`:
#   rm -f ~/.zcompdump; compinit
#Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
#to load these completions, you may need to run this:
#   chmod go-w '/usr/local/share'


#To activate the syntax highlighting, add the following at the end of your .zshrc:
#Ubuntu: /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE=/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ -f "$ZSH_HIGHLIGHT_HIGHLIGHTERS_FILE" ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
#  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# kubectl autocomplete - see  https://kubernetes.io/docs/reference/kubectl/cheatsheet/
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# iTerm2 shell integration
#FIX [[-f ~/.iterm2_shell_integration.zsh]] && source ~/.iterm2_shell_integration.zsh

# Ctrl-U
bindkey \^U backward-kill-line

# brew path addition
export PATH="/usr/local/sbin:$PATH"
# vmware fusion tools path
export PATH=/Volumes/VMware\ Fusion/VMware\ Fusion.app/Contents/Library/:$PATH

# Fuzzy finder config / completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alt-c for fuzzy finder
bindkey "ç" fzf-cd-widget

# Azure auto completion
autoload bashcompinit && bashcompinit
[ -f /usr/local/etc/bash_completion.d/az ] && source /usr/local/etc/bash_completion.d/az

export FZF_DEFAULT_COMMAND='fd --type f --exclude "/Library/" --exclude "/Music/"'
export FZF_CTRL_T_COMMAND='fd --type f --exclude "Library/" --exclude "Music/"'
export FZF_ALT_C_COMMAND='fd --type d --exclude "Library/" --exclude "Music/"'

# Import aliases
source ~/.alias

# Color adjustments (e.g. dir listing)
export LSCOLORS=ExFxDxCxegedabagacad

# for '-?' etc to work in zsh (see https://github.com/ohmyzsh/ohmyzsh/issues/31)
unsetopt nomatch

