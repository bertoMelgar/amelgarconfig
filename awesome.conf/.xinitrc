#!/bin/bash

# fondo de pantalla
xloadimage -onroot ~/datos/fondos/blue-twister-black+violet.jpg &

# lanzamos aplicaciones
#gkrellm &
#monta.miniS &
urxvtd -q -f -o &

# dwm 
#/home/amelgar/bin/dwm.sh

# xmonad 
#/home/amelgar/bin/run-xmonad.sh 

awesome-status &
exec /usr/local/bin/awesome
