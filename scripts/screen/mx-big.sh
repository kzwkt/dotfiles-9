#!/bin/sh
xrandr --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off
pkill -fi compton
compton --backend glx --paint-on-overlay --vsync opengl-swc --no-fading-openclose &
pactl set-card-profile 0 output:hdmi-stereo &
