#!/bin/sh
dbus-update-activation-environment --all  &
dunst &
nm-applet &
/usr/libexec/polkit-mate-authentication-agent-1 &
pipewire &
pipewire-pulse &
/usr/libexec/xdg-desktop-portal-gtk &
wl-paste -t text --watch clipman store --no-persist &
