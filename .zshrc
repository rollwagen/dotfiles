# Lines configured by zsh-newuser-install
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
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
#  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# kubectl autocomplete - see  https://kubernetes.io/docs/reference/kubectl/cheatsheet/
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# iTerm2 shell integration
source ~/.iterm2_shell_integration.zsh

bindkey \^U backward-kill-line

