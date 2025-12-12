#!/bin/bash
cava -p ~/.config/cava/config | while read -r line; do
    echo "$line"
done

