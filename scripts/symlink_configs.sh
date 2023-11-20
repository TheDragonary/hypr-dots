#!/bin/sh

# Delete old folders/symlinks
rm -rf ~/.config/hypr
rm -rf ~/.config/swaylock
rm -rf ~/.config/waybar
rm -rf ~/.config/wlogout
rm -rf ~/.config/swww
rm -rf ~/wallpapers

# Create symbolic links
ln -s ~/hypr-dots/.config/hypr ~/.config/hypr
ln  -s ~/hypr-dots/.config/swaylock ~/.config/swaylock
ln -s ~/hypr-dots/.config/waybar ~/.config/waybar
ln -s ~/hypr-dots/.config/wlogout ~/.config/wlogout
ln -s ~/hypr-dots/.config/swww ~/.config/swww
ln -s ~/hypr-dots/wallpapers ~/wallpapers
