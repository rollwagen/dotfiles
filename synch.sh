#!/usr/bin/env bash

function sync_dotfiles() {
	rsync	--exclude ".git/" \
			--exclude ".gitignore" \
			--exclude "synch.sh" \
			--exclude "README.md" \
			-avh --no-perms . ~;
	
	source ~/.bash_profile;
}

if [ "$1" == "--yes" -o "$1" == "-y" ]; then
	sync_dotfiles;
else
	read -p "Synch [and potentially overwrite] dotfiles home folder? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync_dotfiles;
	fi;
fi;
unset sync_dotfiles;
