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
  pfetch
  fd
  plymouth
)

optional=(
  discord
  spotify
  vscodium
  thunderbird
)

clear

echo "╔════════════════════════════════╗"
echo "║ Dragonary's Hyprland Installer ║"
echo "╚════════════════════════════════╝"

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
    rm -rf yay
  fi
fi

echo ""
read -p 'Begin installation? [Y/n] ' install
if [[ $install == 'N' || $install == 'n' ]]; then
  echo 'Quitting installer...'
  exit
else
  for x in ${pkgs[@]};
  do
    echo $x
  done
  for x in ${fonts[@]};
  do
    echo $x
  done
  for x in ${extras[@]};
  do
    echo $x
  done
  for x in ${optional[@]};
  do
    echo $x
  done
fi
