#!/usr/bin/bash

picom --config ~/.config/picom/picom.conf --backend glx &
nm-applet &
lxqt-policykit-agent &
pipewire &
pipewire-pulse &
dunst &
