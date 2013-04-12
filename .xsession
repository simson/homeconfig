#!/bin/sh
#exec ck-launch-session dbus-launch --exit-with-session
numlockx on
awesome
#exec awesome
#xscreensaver -nosplash  >> ~/log 2>> ~/error
#
#echo "\nxrandr --output DFP3 --mode 1280x1024 --pos 1280x0 --rate 60 \n" >> ~/log 2>> ~/error
#
#xrandr --output DFP3 --mode 1280x1024 --pos 1280x0 --rate 60  >> ~/log 2>> ~/error
#
#xrandr --output DFP4 --mode 1280x1024 --pos 0x0 --rate 60 >> ~/log 2>> ~/error
#
#echo "\nEXPORT\n" >> ~/log 2>> ~/error
#
#export SSH_AUTH_SOCK  >> ~/log 2>> ~/error
#
#export GPG_AGENT_INFO >> ~/log 2>> ~/error
#
#export GNOME_KEYRING_CONTROL >> ~/log 2>> ~/error
#
#export GNOME_KEYRING_PID >> ~/log 2>> ~/error
#xscreensaver -nosplash 
xrandr --output DFP3 --mode 1280x1024 --pos 1280x0 --rate 60 
xrandr --output DFP4 --mode 1280x1024 --pos 0x0 --rate 60 


