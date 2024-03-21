#!/bin/sh

pkgs=(
  hyprland
  kitty
  thunar
  mako
  wofi
  waybar
  wlogout
  swww
  firefox
  vim
  fish
  pywal-16-colors
  xdg-desktop-portal-hyprland
  xdg-user-dirs
  swayidle
  swayosd-git
  grim
  slurp
  swappy
  gvfs
  gvfs-mtp
  ntfs-3g
  htop
  vtop
  btop
  jq
  gcc
  wl-clipboard
  cliphist
  pipewire
  wireplumber
  pavucontrol
  pamixer
  gst-plugin-pipewire
  pacman-contrib
  man
  flatpak
  lxappearance
  xfce4-settings
  polkit-gnome
  gnome-keyring
  qt5-wayland
  qt6-wayland
  qt5ct
  qt6ct
  qt5-graphicaleffects
  qt5-quickcontrols2
  file-roller
  brightnessctl
  bluez
  bluez-utils
  blueman
  nwg-look-bin
  grimblast-git
  swaylock-effects-git
  sddm
  sddm-sugar-candy-git
  papirus-icon-theme
  bibata-cursor-theme
  tumbler
  ffmpegthumbnailer
  thunar-archive-plugin
  nwg-look-bin
)

fonts=(
  gnu-free-fonts
  noto-fonts
  noto-fonts-emoji
  otf-font-awesome
  ttf-jetbrains-mono-nerd
  ttf-fira-sans
  ttf-firacode-nerd
)

extras=(
  libreoffice-fresh
  mpv
  gedit
  feh
  neovim
  gthumb
  wf-recorder
  network-manager-applet
  neofetch
  pfetch
  fd
  plymouth
)

optional=(
  discord
  spotify
  code
  thunderbird
)

clear

echo "╔════════════════════════════════╗
║ Dragonary's Hyprland Installer ║
╚════════════════════════════════╝"

echo 'Installing yay...' 
if pacman -Qi yay &> /dev/null; then
  echo 'Yay already installed. Skipping...'
else
  read -p "Would you like to install yay AUR helper? This is needed to install some packages. Typing 'n' would quit the installer. [Y/n] " yay
  if [[ $yay == 'N' || $yay == 'n' ]]; then
    echo 'Quitting installer...'
    exit
  else
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
  fi
fi

echo ""
read -p 'Begin installation? [Y/n] ' install
if [[ $install == 'Y' || $install == 'y' || $install == '' ]]; then 
  echo -e 'Installing main packages\n'
  for x in ${pkgs[@]};
  do
    echo -e 'Installing '$x
    yay -S --needed --noconfirm $x
    echo -e $x' installed\n'
  done
  echo -e 'Main packages installed\n'

  echo -e 'Installing fonts\n'
  for x in ${fonts[@]};
  do
    echo -e 'Installing '$x
    yay -S --needed --noconfirm $x
    echo -e $x' installed\n'
  done
  echo -e 'Fonts installed\n'
  
  read -ep 'Would you like to install extra packages? You can manually choose each, choose all, or none [Y/a/n] ' extra
  echo ""
  if [[ $extra == 'Y' || $extra == 'y' || $extra == '' ]]; then 
    for x in ${extras[@]};
    do
      echo -e 'Installing '$x
      yay -S --needed $x
      echo -e $x' installed\n'
    done
    echo -e 'Extra packages installed\n'
  elif [[ $extra == 'A' || $extra == 'a' ]]; then
    for x in ${extras[@]};
    do
      echo -e 'Installing '$x
      yay -S --needed --noconfirm $x
      echo -e $x' installed\n'
    done
    echo -e 'Extra packages installed\n'
  else
    echo -e 'Skipping...\n'
  fi

  read -p 'Would you like to install optional packages? This includes Thunderbird, Discord, Spotify and VSCode. You may want to choose certain packages or choose none [Y/n] ' option
  echo ""
  if [[ $option == 'Y' || $option == 'y' || $option == '' ]]; then
    for x in ${optional[@]};
    do
      echo -e 'Installing '$x
      yay -S --needed $x
      echo -e $x' installed\n'
    done
    echo -e 'Optional packages installed\n'
  else 
    echo -e 'Skipping...\n'
  fi

  echo -e 'Package installation complete!\n'

  read -p 'Would you like to copy or symlink configs? Recommended to copy instead. [C/s/n] ' config
  if [[ $config == 'C' || $config == 'c' || $config == '' ]]; then
    echo 'Copying configs...'
    cp -r ~/hypr-dots/.config ~
    cp -r ~/hypr-dots/wallpapers ~
    echo -e 'Configs copied!\n'
  elif [[ $config == 'S' || $config == 's' ]]; then
    echo 'Symlinking configs...'
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
    rm -rf ~/.config/fish
    rm -rf ~/.config/starship.toml
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
    ln -s ~/hypr-dots/.config/fish ~/.config
    ln -s ~/hypr-dots/.config/starship.toml ~/.config
    echo -e 'Configs symlinked!\n'
  else
    echo -e 'Skipping...\n'
  fi
  
  read -p 'Would you like to install Starship prompt? [Y/n] ' star
  if [[ $star == 'Y' || $star == 'y' || $star == '' ]]; then
    curl -sS https://starship.rs/install.sh | sh
  else
    echo -e 'Skipping...\n'
  fi

  echo 'Applying GTK theme...'
  xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
  gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
  xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
  gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
  gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
  echo -e 'Applied!\n'

  echo 'Enabling Wifi and Bluetooth systemd services...'
  systemctl enable wpa_supplicant.service
  systemctl enable bluetooth.service
  echo -e 'Enabled!\n'

  read -p 'Are you dual-booting? This is to fix the time. [y/N] ' dual
  if [[ $dual == 'Y' || $dual == 'y' ]]; then 
    timedatectl set-local-rtc 1
    echo -e 'Time set!\n'
  else
    echo -e 'Skipping...\n' 
  fi

  echo 'Setting power key to suspend...'
  sudo mkdir /etc/systemd/logind.conf.d
  echo "[Login]
  HandlePowerKey=suspend" | sudo tee /etc/systemd/logind.conf.d/powerkey-suspend.conf
  echo -e 'Set!\n'

  echo 'Fixing SwayOSD brightness...'
  echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"' | sudo tee /etc/udev/rules.d/99-swayosd.rules
  sudo usermod -a -G video $USER
  echo -e 'Fixed!\n'

  echo -e 'This next part will just detect some drivers and see if they need fixing\n'
  echo 'Detecting i8042 keyboard driver...'
  if cat /proc/bus/input/devices | grep i8042 &> /dev/null; then
    echo 'i8042 keyboard driver detected. Fixing...'
    git clone https://github.com/mistine/i8042-keyboard-fix-linux
    cd i8042-keyboard-fix-linux
    sudo mv keyboard-reset.sh /usr/lib/systemd/system-sleep/
    chmod a+x /usr/lib/systemd/system-sleep/keyboard-reset.sh
    cd ..
    rm -rf i8042-keyboard-fix-linux
    echo -e 'Fixed!\n'
  else 
    echo -e 'i8042 driver undetected. Lucky you.. Skipping...\n'
  fi

  echo 'Detecting Broadcom BCM43142'
  if lspci | grep BCM43142 &> /dev/null; then 
    echo 'Broadcom BCM43142 detected. Installing firmware...'
    yay -S --needed --noconfirm bcm43142a0-firmware
    echo -e 'Installed!\n'
  else
    echo -e 'Broadcom BCM43142 undetected. Lucky you.. Skipping...\n'
  fi

  echo 'Enabling SDDM and applying theme...'
  sudo systemctl enable sddm.service
  echo -e "[Theme]\nCurrent=sugar-candy\nCursorTheme=Bibata-Modern-Classic\nCursorSize=24" | sudo tee /etc/sddm.conf
  echo -e 'Done!\n'
  
  read -p 'Do you have a touchpad? This is to enable tapping in SDDM. [y/N] ' touchpad
  if [[ $touchpad == 'Y' || $touchpad == 'y' ]]; then 
    echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"

        Option "Tapping" "on"
        Option "NaturalScrolling" "on"
        Option "MiddleEmulation" "on"
        Option "DisableWhileTyping" "on"
EndSection' | sudo tee /etc/X11/xorg.conf.d/20-touchpad.conf
    echo -e 'Fixed!\n'
  else 
    echo -e 'Skipping...\n'
  fi

  echo -e 'Installation fully complete!\n'

  read -p 'Would you like to reboot now? [Y/n] ' re 
  if [[ $re == 'Y' || $re == 'y' || $re == '' ]]; then
    echo "Thank you for using Dragonary's Hyprland Installer!"
    echo 'Rebooting...'
    sleep 1
    sudo reboot
  else
    echo ''
    read -p 'Would you like to start SDDM instead? [Y/n] ' sd
    if [[ $sd == 'Y' || $sd == 'y' || $sd == '' ]]; then
      echo "Thank you for using Dragonary's Hyprland Installer!"
      echo 'Starting SDDM...'
      sleep 1
      sudo systemctl start sddm.service
    else
      echo -e "\nThank you for using Dragonary's Hyprland Installer!\n"
      echo 'Quitting installer... '
    fi 
  fi 

else
  echo 'Quitting installer...'
  exit
fi
