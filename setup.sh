#!/bin/sh

set -x

# git
git config --global user.email "leskiv.taras@gmail.com"
git config --global user.name "Taras Leskiv"

# core
sudo pacman -S zsh vim --noconfirm
