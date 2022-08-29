#!/bin/sh
export QT_QPA_PLATFORMTHEME=qt5ct
picom --experimental-backend &
wal -R
xset r rate 230 50
setxkbmap -option caps:swapescape
polybar top &
polybar bottom &
mpd
