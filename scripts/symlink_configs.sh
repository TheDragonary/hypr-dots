#!/bin/sh

# Delete old folders/symlinks
rm -rf ~/.config/hypr
rm -rf ~/.config/swaylock
rm -rf ~/.config/swayidle
rm -rf ~/.config/waybar
rm -rf ~/.config/wlogout
rm -rf ~/.config/swww
rm -rf ~/.config/mako
rm -rf ~/.config/ranger
rm -rf ~/wallpapers

# Create symbolic links
ln -s ~/hypr-dots/.config/hypr ~/.config
ln -s ~/hypr-dots/.config/swaylock ~/.config
ln -s ~/hypr-dots/.config/swayidle ~/.config
ln -s ~/hypr-dots/.config/waybar ~/.config
ln -s ~/hypr-dots/.config/wlogout ~/.config
ln -s ~/hypr-dots/.config/swww ~/.config
ln -s ~/hypr-dots/.config/mako ~/.config
ln -s ~/hypr-dots/.config/ranger ~/.config
ln -s ~/hypr-dots/wallpapers ~
