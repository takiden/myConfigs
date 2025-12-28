#!/usr/bin/bash

get_default_sink() {
    pactl get-default-sink
}

get_sink_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1
}

get_sink_name() {
    local sink=$(get_default_sink)
    pactl list sinks | grep -A 20 "Name: $sink" | grep "Description:" | cut -d: -f2 | xargs
}

case "$1" in
    display)
        device=$(get_sink_name)
        volume=$(get_sink_volume)
        echo "🔊 ${device:0:20} ${volume}%"
        ;;
    *)
        device=$(get_sink_name)
        volume=$(get_sink_volume)
        echo "🔊 ${device:0:20} ${volume}%"
        ;;
esac
