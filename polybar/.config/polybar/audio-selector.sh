#!/usr/bin/bash

# Get list of sinks
mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
mapfile -t descriptions < <(pactl list sinks | grep -E "Name:|Description:" | sed 'N;s/\n/ /' | awk -F'Description: ' '{print $2}')

# Build rofi menu
menu=""
current_sink=$(pactl get-default-sink)
for i in "${!sinks[@]}"; do
    if [ "${sinks[$i]}" = "$current_sink" ]; then
        menu+="$((i+1)). ✓ ${descriptions[$i]}\n"
    else
        menu+="$((i+1)). ${descriptions[$i]}\n"
    fi
done

# Show menu and get selection
selected=$(echo -e "$menu" | rofi -dmenu -i -p "Select Audio Device" -format "s" -theme-str 'window {width: 600px;}')

if [ -n "$selected" ]; then
    # Extract number from selection
    num=$(echo "$selected" | grep -oP '^\d+')
    if [ -n "$num" ]; then
        idx=$((num-1))
        if [ $idx -ge 0 ] && [ $idx -lt ${#sinks[@]} ]; then
            pactl set-default-sink "${sinks[$idx]}"
        fi
    fi
fi
