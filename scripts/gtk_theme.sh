#!/bin/sh

xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
