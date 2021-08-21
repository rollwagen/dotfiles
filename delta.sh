# show diff of dotfiles in current dir with home dir ("~")
for f in .*
do
	if [ -f ~/"$f" ]; then
		echo "\nDiffing file \"\033[1;33m$f\033[0m\"..."
		delta --side-by-side --max-line-length=80 ~/"$f" "$f"
	fi
done
