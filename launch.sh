#!/bin/sh

echo "Create basic folders"
mkdir ~/repos ~/Videos/Movies ~/Videos/Shows

# to list packages installed by pacman (excluding AUR):
# pacman -Qqen
# to list packages installed from AUR:
# pacman -Qqem

echo "Installing packages from the arch repository"
sudo pacman -S --noconfirm --needed < packages-repository.txt

echo "Installing packages from the AUR"
yay -S --needed < packages-AUR.txt

echo "Cloning dotfiles to `~/repos/dotfiles`"
git clone https://github.com/omtheturtle/dotfiles ~/repos/dotfiles

cd ~/repos/dotfiles

echo "Copying config files..."
cp -r .config/. ~/.config
cp .vimrc .zshrc .gitconfig ~

# This assumes that the OSS version of VSCode is installed
# that is available from the arch package repository
cp .vscode/settings.json ~/.config/Code\ -\ OSS/User/

[ ! -d "~/.local/share/fonts" ] && mkdir ~/.local/share/fonts

echo "Installing JetBrains Mono font"
cd /tmp
wget -q -O jbmono.zip https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip && unzip jbmono.zip && rm jbmono.zip

mv jbmono/ttf/ ~/.local/share/fonts

echo "All done!"

