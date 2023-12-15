#!/bin/sh

# Create array of the wallpaper directory
dir=($HOME/animated-wallpapers/*)

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

wallpaper="${dir[counter]}" # New wallpaper
echo $wallpaper

# Set the wallpaper
swww img "$wallpaper" --transition-type=grow --transition-pos=0.98,0.97 --transition-fps=60 --transition-step=90

# Run pywal to generate color scheme based on the new wallpaper
wal -i "$wallpaper" -s

. $HOME/.config/waybar/restart_waybar.sh
. $HOME/.config/mako/update-theme.sh
