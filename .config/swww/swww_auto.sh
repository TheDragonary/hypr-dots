#!/bin/sh

wallpaper_dir=("$HOME/wallpapers"/*)
cache_folder="$HOME/.cache"
current_wallpaper="$cache_folder/current_wallpaper"
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
            name="${wp%.*}"
            echo "$wp"
            echo "$ext"
            echo "$name"
            rm -f "$current_wallpaper".*
            cp "$name.$ext" "$current_wallpaper.$ext"
            swww img "$current_wallpaper.$ext" --transition-type=grow --transition-pos=0.98,0.97 --transition-fps=60 --transition-step=90
            # Store the current wallpaper path for the next iteration
            echo "$wp" > "$last_wallpaper_file"
        fi
    fi

    sleep 600 # Wait for 10 minutes before changing to the next wallpaper
done

