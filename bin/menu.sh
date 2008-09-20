#!/bin/bash
### menu de awesome cuando pulsamos F2 ###
#
# Concept from http://www.calmar.ws/tmp/dmenu_do
#
##

# build your menu here with whatever simple names you want to use
prog="urxvt
firefox3
k3b
soporte
thunar
pcmanfm
mlgui
gnomad2
konqueror
evince
tellico
weechat
links-graphic
vim
links
mc
kate
truecrypt
pidgin
logout"

cmd=$(awesome-menu -y 160 <<< "$prog")

case ${cmd%% *} in
  urxvt)    awesome-client <<< "0 spawn urxvt -ls";;
  #vim)   echo "0 spawn $(urxvt -e vim)" > asesome-client;;
  links|weechat|mc|vim) echo "0 spawn $(urxvt -fn "xft:Bitstream Vera Sans Mono:pixelsize=16" -e ${cmd})" > awesome-client;;
  logout)   awesome-client <<< "0 quit";;
  #restart)  awesome-client <<< "0 spawn urxvt -e '/sbin/shutdown -r'";;
  *)        awesome-client <<< "0 spawn ${cmd}";;
esac

