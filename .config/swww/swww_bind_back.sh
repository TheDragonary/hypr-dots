#!/bin/sh

# Create array of the wallpaper directory and define file locations
dir=($HOME/wallpapers/*)
cache_folder=$HOME/.cache
current_wallpaper="$cache_folder/current_wallpaper"

# Create counter.txt if it doesn't exist. Used for keeping track of the wallpaper number
if [ ! -f counter.txt ]; then
    echo 0 > counter.txt
fi

# Set the number in counter.txt to the counter variable
counter=$(<counter.txt)
echo "$(<counter.txt)" # Current counter number
echo "${dir[counter]}" # Current wallpaper

# Decrement the number in counter
((counter--))

# If the counter is higher than or equal to the number of items in the array or less than or equal to 0 - number of items, it will reset the counter to 0
if [ $counter -ge ${#dir[@]} ] || [ $counter -le $((0-${#dir[@]})) ]; then
    counter=0
fi

# Update counter.txt with the new number
echo $counter > counter.txt

echo "$(<counter.txt)" # New counter number
echo "${dir[counter]}" # New wallpaper

# Set the extension of the image file to the ext variable
ext="${dir[counter]##*.}"

# Remove existing files in the cache folder before copying the new wallpaper
rm -f "$current_wallpaper".*

# Copy the new wallpaper to the cache folder
cp "${dir[counter]}" "$current_wallpaper.$ext"

# Run pywal to generate color scheme based on the new wallpaper
wal -i "$current_wallpaper.$ext" -s

# Set the wallpaper
swww img "$current_wallpaper.$ext" --transition-type=grow --transition-pos=0.98,0.97 --transition-fps=60 --transition-step=90

. $HOME/.config/waybar/restart_waybar.sh
. $HOME/.config/mako/update-theme.sh
