#!/usr/bin/bash

# Get list of sinks
mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
mapfile -t descriptions < <(pactl list sinks | grep -E "Name:|Description:" | sed 'N;s/\n/ /' | awk -F'Description: ' '{print $2}')

current_sink=$(pactl get-default-sink)

# Create terminal menu
i3-msg exec "alacritty -e bash -c '
    echo \"Select Audio Device:\"
    echo \"\"
    current=\"$current_sink\"
    sinks=(${sinks[@]})
    descriptions=(${descriptions[@]})

    for i in \${!sinks[@]}; do
        if [ \"\${sinks[\$i]}\" = \"\$current\" ]; then
            echo \"\$((i+1)). ✓ \${descriptions[\$i]}\"
        else
            echo \"\$((i+1)). \${descriptions[\$i]}\"
        fi
    done

    echo \"\"
    echo -n \"Enter number (or ESC to cancel): \"
    read -n 1 choice

    if [[ \$choice =~ ^[0-9]+$ ]]; then
        idx=\$((choice-1))
        if [ \$idx -ge 0 ] && [ \$idx -lt \${#sinks[@]} ]; then
            pactl set-default-sink \"\${sinks[\$idx]}\"
        fi
    fi
'"
