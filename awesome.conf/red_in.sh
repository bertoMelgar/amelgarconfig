#!/bin/bash
IN=  #variable global
oIN=0
seg=1
kil=1000
kps=$kil*$seg

#funcion que devuelve bytes de entrada
getIN() {
  fIN=`grep wlan1 /proc/net/dev | sed 's/:/\ /' | awk '{print $2}'`
  IN=$fIN
  return 0
}

getIN
oIN=$IN

sleep 1

getIN
nIN=$IN

cal=$[(`echo $oIN-$nIN | bc`)]
#echo $cal

cal3=$[(`echo "-($cal)/$kps" | bc`)]
echo $cal3
