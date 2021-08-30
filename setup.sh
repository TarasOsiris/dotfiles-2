#!/bin/sh

set -x

# git
git config --global user.email "leskiv.taras@gmail.com"
git config --global user.name "Taras Leskiv"

# core
sudo pacman -S yay zsh vim neovim htop stow fzf the_silver_searcher --noconfirm

yay -S bat --noconfirm

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

# zsh plugins
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git@github.com:zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@github.com:MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-you-should-use

# vim
# Plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# symlink

# aliases
rm -f $HOME/aliases.sh
touch $HOME/localaliases.sh

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

# source this in .zshrc
ln -s $HOME/dotfiles/aliases.sh $HOME/aliases.sh

# VIM
rm -f $HOME/.vimrc
ln -s $HOME/dotfiles/init.vim $HOME/.vimrc
rm -f $HOME/.vimrc
ln -s $HOME/dotfiles/coc.nvim $HOME/coc.nvim
rm -f $HOME/.config/nvim/init.vim

[ ! -d $HOME/.config/nvim ] && mkdir $HOME/.config/nvim
# for plugin manager to work
rm -rf $HOME/.config/nvim/autoload
ln -s $HOME/.vim/autoload $HOME/.config/nvim/autoload

rm -f $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim

rm -f $HOME/.ideavimrc
ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc

rm -f $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

rm -f $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig

rm -f $HOME/.gitignored
ln -s $HOME/dotfiles/.gitignored $HOME/.gitignored

rm -f $HOME/.config/yakuakerc
ln -s $HOME/dotfiles/.config/yakuakerc $HOME/.config/yakuakerc

git config --global core.excludesFile $HOME/.gitignored
