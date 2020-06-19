
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_INSECURE_REDIRECT=1


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=ExFxDxCxegedabagacad

source /usr/local/etc/profile.d/bash_completion.sh
source /usr/local/etc/bash_completion.d/az
# git bash completion
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
complete -C /usr/local/bin/terraform terraform

#alias vmrun=/Applications/VMware\ Fusion.app/Contents/Library/vmrun

PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin

#If you need to have curl-openssl first in your PATH run:
#  echo 'export PATH="/usr/local/opt/curl-openssl/bin:$PATH"' >> ~/.bash_profile

export PATH="/usr/local/sbin:$PATH"


alias ccat='ccat --bg=dark'
alias c='cat'
alias grep='grep --color=auto'

alias ovftool='/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool'
alias vmware-vdiskmanager='/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager'
#alias kubectl='minikube kubectl'
alias vless=/usr/share/vim/vim81/macros/less.sh
alias k=kubectl

# VMware disk cleanup (defrag) and shrink.
vdc() {
	echo $1
	vmware-vdiskmanager -d $1; vmware-vdiskmanager -p $1;  vmware-vdiskmanager -k $1;
}
# export -f vdc
# find . -name disk.vmdk -exec /bin/bash -c 'vdc "$0"' {} \;

alias zsh='/usr/local/bin/zsh'
# export PATH="/usr/local/opt/openjdk@11/bin:$PATH