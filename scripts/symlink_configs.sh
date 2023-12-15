#!/bin/sh

# Delete old folders/symlinks
rm -rf ~/.config/hypr
rm -rf ~/.config/swaylock
rm -rf ~/.config/swayidle
rm -rf ~/.config/waybar
rm -rf ~/.config/wlogout
rm -rf ~/.config/swww
rm -rf ~/.config/swww-animated
rm -rf ~/.config/kitty
rm -rf ~/.config/alacritty
rm -rf ~/.config/mako
rm -rf ~/.config/ranger
rm -rf ~/.config/neofetch
rm -rf ~/.config/wofi
rm -rf ~/.config/wal
rm -rf ~/.config/starship.toml

# Create symbolic links
ln -s ~/hypr-dots/.config/hypr ~/.config
ln -s ~/hypr-dots/.config/swaylock ~/.config
ln -s ~/hypr-dots/.config/swayidle ~/.config
ln -s ~/hypr-dots/.config/waybar ~/.config
ln -s ~/hypr-dots/.config/wlogout ~/.config
ln -s ~/hypr-dots/.config/swww ~/.config
ln -s ~/hypr-dots/.config/swww-animated ~/.config
ln -s ~/hypr-dots/.config/kitty ~/.config
ln -s ~/hypr-dots/.config/alacritty ~/.config
ln -s ~/hypr-dots/.config/mako ~/.config
ln -s ~/hypr-dots/.config/ranger ~/.config
ln -s ~/hypr-dots/.config/neofetch ~/.config
ln -s ~/hypr-dots/.config/wofi ~/.config
ln -s ~/hypr-dots/.config/wal ~/.config
ln -s ~/hypr-dots/.config/starship.toml ~/.config
