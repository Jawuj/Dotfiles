#!/usr/bin/env python3
import subprocess
import json

try:
    # Obtiene estado: Playing, Paused, etc.
    status = subprocess.check_output(
        ["playerctl", "status"], text=True
    ).strip()
    
    # Obtiene artista y título
    artist = subprocess.check_output(
        ["playerctl", "metadata", "artist"], text=True
    ).strip()
    title = subprocess.check_output(
        ["playerctl", "metadata", "title"], text=True
    ).strip()

    # Icono según estado
    icon = "" if status == "Playing" else ""

    output = {
        "icon": icon,
        "text": f"{artist} - {title}"
    }
except subprocess.CalledProcessError:
    output = {
        "icon": "🎵",
        "text": "No media playing"
    }

print(json.dumps(output))

