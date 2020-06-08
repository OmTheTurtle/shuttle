#!/bin/sh

echo Create basic folders
mkdir ~/repos ~/Videos/Movies ~/Videos/Shows

echo Installing packages from the arch repository
sudo pacman -S --noconfirm --needed < packages-repository.txt

echo Installing packages from the AUR
yay -S --needed < packages-AUR.txt

echo "Cloning dotfiles to `~/repos/dotfiles`"
git clone https://github.com/omtheturtle/dotfiles ~/repos/dotfiles

# Change to dotfiles directory
cd ~/repos/dotfiles

echo Copying config files...
cp -r .config/. ~/.config
cp .vimrc .zshrc .gitconfig ~

# This assumes that the OSS version of VSCode is installed
# that is available from the arch package repository
cp .vscode/settings.json ~/.config/Code\ -\ OSS/User/

echo All done!

