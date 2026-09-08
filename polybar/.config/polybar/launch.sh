#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

mapfile -t monitors < <(polybar --list-monitors | sed 's/:.*//')

for index in "${!monitors[@]}"; do
    if (( index == 0 )); then
        bar=main
    else
        bar=secondary
    fi

    MONITOR="${monitors[index]}" polybar "$bar" &
done
