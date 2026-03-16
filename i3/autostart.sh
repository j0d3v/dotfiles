#!/bin/bash
setxkbmap fr
[ -f "$HOME/.fehbg" ] && "$HOME/.fehbg" &
picom --config "$HOME/.config/picom/picom.conf" &
light-locker &
lxqt-policykit-agent &
xfce4-power-manager &
"$HOME/.config/polybar/launcher.sh" &
dunst &
nm-applet &
/usr/libexec/xdg-desktop-portal-gtk &
brightnessctl s 300
