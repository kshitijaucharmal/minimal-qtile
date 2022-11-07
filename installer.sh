#!/bin/sh
yay -Syyu --needed $(cat packages.txt)
# copy configs
cp -rf alacritty ~/.config/
cp -rf neofetch ~/.config/
cp -rf nvim ~/.config/
cp -rf picom ~/.config/
cp -rf polybar ~/.config/
cp -rf qtile ~/.config/
cp -rf ranger ~/.config/
cp -rf rofi ~/.config/
cp -rf scripts ~/.scripts
cp -rf wallpapers ~/Pictures/
cp -rf zshrc ~/.zshrc
sudo cp -rf fonts/* /usr/share/fonts/
wal -i wallpapers/wallpaper.jpg