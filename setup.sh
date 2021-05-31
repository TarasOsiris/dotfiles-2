#!/bin/sh

set -x

# git
git config --global user.email "leskiv.taras@gmail.com"
git config --global user.name "Taras Leskiv"

# core
sudo pacman -S yay zsh vim neovim htop stow fzf --noconfirm

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

# symlink
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo "Script folder: $SCRIPTPATH"
cd $SCRIPTPATH

# aliases
touch $HOME/localaliases.sh
rm -f $HOME/aliases.sh
# source this in .zshrc
ln -s $SCRIPTPATH/aliases.sh $HOME/aliases.sh

rm -f $HOME/.vimrc
ln -s $SCRIPTPATH/init.vim $HOME/.vimrc
rm -f $HOME/.config/nvim/init.vim
ln -s $SCRIPTPATH/init.vim $HOME/.config/nvim/init.vim
ln -s $SCRIPTPATH/init.vim $HOME/.config/nvim/.ideavimrc

rm -f $HOME/.zshrc
ln -s $SCRIPTPATH/.zshrc $HOME/.zshrc

rm -f $HOME/.gitconfig
ln -s $SCRIPTPATH/.gitconfig $HOME/.gitconfig

rm -f $HOME/.gitignored
ln -s $SCRIPTPATH/.gitignored $HOME/.gitignored

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

rm -f $HOME/.config/yakuakerc
ln -s $SCRIPTPATH/.config/yakuakerc $HOME/.config/yakuakerc
