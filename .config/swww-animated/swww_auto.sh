#!/bin/sh

# Create array of the wallpaper directory and define file locations
wallpaper_dir=($HOME/animated-wallpapers/*)
cache_folder="$HOME/.cache"
last_wallpaper_file="$cache_folder/last_wallpaper.txt"

while true; do
    # Check if the last wallpaper file exists
    if [ -f "$last_wallpaper_file" ]; then
        last_wallpaper=$(<"$last_wallpaper_file")
        # Find the index of the last wallpaper in the array
        index=-1
        for i in "${!wallpaper_dir[@]}"; do
            if [ "${wallpaper_dir[i]}" = "$last_wallpaper" ]; then
                index=$i
                break
            fi
        done
        # Increment the index to get the next wallpaper
        ((index++))
        # If index is out of bounds, reset it to 0
        if [ $index -ge ${#wallpaper_dir[@]} ]; then
            index=0
        fi
    else
        index=0
    fi

    # Set the new wallpaper
    if [ $index -ne -1 ]; then
        wp="${wallpaper_dir[index]}"
        if [ -f "$wp" ]; then
            ext="${wp##*.}"
            echo "$wp"
            echo "$ext"
            swww img "$wp"
            # Run pywal to generate color scheme based on the new wallpaper
	    wal -i "$wp" -s
	    . $HOME/.config/waybar/restart_waybar.sh
	    . $HOME/.config/mako/update-theme.sh
            # Store the current wallpaper path for the next iteration
            echo "$wp" > "$last_wallpaper_file"
        fi
    fi

    sleep 600 # Wait for 10 minutes before changing to the next wallpaper
done
