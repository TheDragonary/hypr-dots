# Hyprland Dotfiles

- OS: Arch Linux
- Window Manager: Hyprland
- Terminal: Kitty
- Shell: fish + Starship
- Bar: Waybar
- Runner: Wofi
- Lock Screen: Swaylock
- Power Screen: wlogout
- Wallpapers: swww
- Colours: pywal
- Notifications: Mako

The coolest feature is probably the wallpaper switcher, and I guess the waybar is neat too. The colours changing with the wallpaper is also pretty cool too.

## Screenshots
![](https://github.com/TheDragonary/hypr-dots/blob/main/screenshots/screenshot.png)
![](https://github.com/TheDragonary/hypr-dots/blob/main/screenshots/screenshot2.png)

## Installation
Clone the repo
```
git clone https://github.com/TheDragonary/hypr-dots && cd hypr-dots
```
Run ```install_yay.sh``` to install yay AUR helper, which is used to install packages in ```install_hypr.sh```

Run ```install_hypr.sh``` to install all packages and copy config files and wallpapers to home directory or run ```copy_configs.sh```

(I still need to refine the scripts, currently ```install_hypr.sh``` just has most of the packages that I have installed which a lot of them you may not need, it is simply for my convenience at the moment, so feel free to edit that for yourself. I also need to create a new main script which you would run once and it would do everything for you, it would also give you choices on what to install, right now I just have multiple scripts to do the job.)
