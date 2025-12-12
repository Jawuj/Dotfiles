#!/bin/bash

hyprctl workspaces | awk '
{
    ws = $2
    active = ($3 == "1") ? "*" : " "
    printf "[%s%s] ", ws, active
}
END { print "" }'

