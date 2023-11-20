#!/bin/bash

wpdir="$HOME/wallpapers"
wallpapers=($wpdir/*)
echo $wallpapers
source wallpaper_number.sh
echo x=$(($x+1)) | tee wallpaper_number.sh
if (($x+1>${#wallpapers[@]})); then
	echo x=1 | tee wallpaper_number.sh
fi
echo $x
echo "$HOME/wallpapers/$x.jpg"
cp "$HOME/wallpapers/$x.jpg" $HOME/.cache/current_wallpaper.jpg
