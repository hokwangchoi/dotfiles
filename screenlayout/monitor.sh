#!/bin/sh
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 3840x2160 --pos 1920x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal
xrandr --dpi 150
xrdb ~/dotfiles/screenlayout/Xresources_monitor
xset -dpms
xset s off

nitrogen --set-auto /home/hc/Pictures/Wallpapers/heli_ddln_3840.jpg --head=0 && nitrogen --set-auto /home/hc/Pictures/Wallpapers/heli_ddln.jpg --head=1
