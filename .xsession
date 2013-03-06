#!/bin/sh
exec ck-launch-session dbus-launch --exit-with-session gnome-session --session=localawesome
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
