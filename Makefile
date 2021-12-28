install: install-vim install-bash install-zsh install-psql \
         install-virtualenvwrapper \
         install-git install-python install-keybindings

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-terminal-settings:
ifeq ($(shell uname),Darwin)
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal/old-settings.bak
	cp terminal/com.apple.Terminal.plist ~/Library/Preferences
	@echo "Old terminal settings were saved in terminal folder"
endif

# see -> https://github.com/mitsuhiko/dotfiles/blob/master/Makefile
