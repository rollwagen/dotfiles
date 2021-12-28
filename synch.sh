#!/usr/bin/env bash

command -v rsync > /dev/null || (echo 'ERROR: rsync not found. Please install first.'; exit;)

cd "$(dirname "$0")" || exit 5
#git pull

function doSynch() {
	rsync --backup --exclude ".git/" \
		--exclude ".gitignore" \
		--exclude "synch.sh" \
		--exclude "README.md" \
		--exclude "brew.sh" \
		--exclude "macos.sh" \
		--exclude "delta.sh" \
		--exclude "manual.md" \
		--exclude "ubuntu.sh" \
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
