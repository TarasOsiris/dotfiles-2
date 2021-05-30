#!/bin/sh

set -x

# git
git config --global user.email "leskiv.taras@gmail.com"
git config --global user.name "Taras Leskiv"

# core
sudo pacman -S zsh vim stow --noconfirm

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

# symlink
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo "Script folder: $SCRIPTPATH"
cd $SCRIPTPATH

rm -f $HOME/.vimrc
ln -s $SCRIPTPATH/.vimrc $HOME/.vimrc

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
