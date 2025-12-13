#!/usr/bin/env sh

LAST_FILE=""
LAST_DURATION=0
LAST_START=0

while true; do
    # Espera cambio real del reproductor
    mpc idle player >/dev/null

    NOW=$(date +%s)
    FILE="$(mpc --format %file% current)"
    [ -z "$FILE" ] && continue

    # Si había una canción anterior, evaluarla
    if [ -n "$LAST_FILE" ] && [ "$LAST_DURATION" -gt 0 ]; then
        ELAPSED=$((NOW - LAST_START))
        PERCENT=$((ELAPSED * 100 / LAST_DURATION))

        if [ "$PERCENT" -ge 50 ]; then
            raw="$(mpc sticker "$LAST_FILE" get play_count 2>/dev/null)"
            count="${raw#play_count=}"
            [ "$count" = "$raw" ] && count=0

            mpc sticker "$LAST_FILE" set play_count $((count + 1))
        fi
    fi

    # Guardar info de la canción actual (B)
    LAST_FILE="$FILE"
    LAST_DURATION=$(mpc --format %time% current | awk -F: '{print $1*60+$2}')
    LAST_START="$NOW"
done
