
# vim / vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim / zenburn theme
curl -sLo ~/.vim/colors/zenburn.vim --create-dirs \
https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# rust and delta (diff viewer)
curl https://sh.rustup.rs -sSf | sh -s -- -y
~/.cargo/bin/cargo install git-delta
