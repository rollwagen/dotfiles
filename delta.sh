# show diff of dotfiles in current dir with home dir ("~")
for f in .*
do
	if [ -f ~/"$f" ]; then
		echo "\nDiffing file \"$f\"..."
		delta --side-by-side --max-line-length=80 ~/"$f" "$f"
	fi
done
