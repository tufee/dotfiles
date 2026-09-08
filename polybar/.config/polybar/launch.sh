#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR="$(polybar --list-monitors | sed -n '1s/:.*//p')"
MONITOR="$MONITOR" polybar main &
