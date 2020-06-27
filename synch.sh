#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 5
#git pull

function doSynch() {
	rsync --exclude ".git/" \
		--exclude ".gitignore" \
		--exclude "synch.sh" \
		--exclude "README.md" \
		--exclude "brew.sh" \
		--exclude "macos.sh" \
		--exclude "manual.md" \
		-avh . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doSynch
else
  read -p "This might overwrite existing files in your homedir. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doSynch
  fi
fi

unset doSynch
