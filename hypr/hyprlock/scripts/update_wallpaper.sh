#!/bin/bash

WALLPAPER_PATH=$(swww query | grep "image:" | head -n 1 | awk -F'image: ' '{print $2}')

TARGET=~/.config/hypr/hyprlock/current_wallpaper.png

if [[ -f "$WALLPAPER_PATH" ]]; then
    
    EXT="${WALLPAPER_PATH##*.}"
    if [[ "$EXT" != "png" ]]; then
        echo "Convirtiendo $WALLPAPER_PATH → PNG..."
        convert "$WALLPAPER_PATH" "$TARGET"
    else
        cp "$WALLPAPER_PATH" "$TARGET"
    fi

else
    echo "Usando fallback"
    cp ~/.config/hypr/hyprlock/fallback.png "$TARGET"
fi

sleep 0.2  

hyprlock -c ~/.config/hypr/hyprlock.conf
