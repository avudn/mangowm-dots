#!/bin/sh
dir="$HOME/Pictures/Screenshots"
geom=$(slurp) || exit 0 # exit quietly if you cancel the selection
grim -g "$geom" - | tee "$dir/$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy -t image/png
