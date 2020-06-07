#!/bin/sh

# Create some basic folders
mkdir ~/repos ~/Videos/Movies ~/Videos/Shows

# Install base packages
sudo pacman -S --noconfirm --needed < packages-repository.txt

# Install packages from AUR
yay -S --needed < packages-AUR.txt

# Clone dotfiles
git clone https://github.com/omtheturtle/dotfiles ~/repos/dotfiles

# TODO: copy all the config files to their respective directories
cp -r ~/repos/dotfiles/.config/. ~/.config

