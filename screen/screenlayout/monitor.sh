#!/bin/sh
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 3840x2160 --pos 1920x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal
xrandr --dpi 150
xrdb /home/hc/.screenlayout/.Xresources_monitor
xset -dpms
xset s off
