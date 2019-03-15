#!/bin/bash

# pkill -fi term-up                    || true
# pkill -fi term-right                 || true
# pkill -fi term-ranger                || true
pkill -fi Xfce4-terminal               || true

xfce4-terminal -T term-up &
xfce4-terminal -T term-right &
xfce4-terminal -T term-ranger --execute ranger &
xfce4-terminal -T term-music --execute cmus &

# vim: nowrap
