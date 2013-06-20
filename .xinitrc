#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

exec xcompmgr -f -D3 &
exec awesome
#exec xfce4-session
