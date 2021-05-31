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

# zsh plugins
git clone git@github.com:com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git@github.com:com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@github.com:MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-you-should-use

# symlink
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo "Script folder: $SCRIPTPATH"
cd $SCRIPTPATH

# aliases
rm -f $HOME/aliases.sh
touch $HOME/localaliases.sh

# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

# source this in .zshrc
ln -s $SCRIPTPATH/aliases.sh $HOME/aliases.sh

rm -f $HOME/.vimrc
ln -s $SCRIPTPATH/init.vim $HOME/.vimrc
rm -f $HOME/.config/nvim/init.vim

[ ! -d $HOME/.config/nvim ] && mkdir $HOME/.config/nvim
ln -s $SCRIPTPATH/init.vim $HOME/.config/nvim/init.vim
ln -s $SCRIPTPATH/init.vim $HOME/.config/nvim/.ideavimrc

rm -f $HOME/.zshrc
ln -s $SCRIPTPATH/.zshrc $HOME/.zshrc

rm -f $HOME/.gitconfig
ln -s $SCRIPTPATH/.gitconfig $HOME/.gitconfig

rm -f $HOME/.gitignored
ln -s $SCRIPTPATH/.gitignored $HOME/.gitignored

rm -f $HOME/.config/yakuakerc
ln -s $SCRIPTPATH/.config/yakuakerc $HOME/.config/yakuakerc
