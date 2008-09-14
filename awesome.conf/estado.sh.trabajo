#!/bin/bash

updateClock() 
{
date=`date +" %d-%m-%y  %l:%M " | sed 's/  / /g'`
echo 0 widget_tell sbtop tbclock text "$date" | awesome-client
#echo 0 widget_tell tbreloj text "$date" | awesome-client
}

updateMem()
{
mem_vals=`free -m | grep '^Mem:' | sed 's/Mem://g'`
mtot=`echo $mem_vals | sed 's/ .*//g'`
muse=`echo $(echo $mem_vals | cut -f2,5,6 -d" " | sed 's/ / - /g') | bc`
pmem=`echo "100 * $muse / $mtot" | bc`

echo 0 widget_tell sbbottom pb_mem data mem "$pmem" | awesome-client
}

updateCpu()
{
CPUSTAT="$HOME/.cpustat"
old_cpu_vals=(`head -1 "$CPUSTAT"`)
cpu_old_user=${old_cpu_vals[0]}
cpu_old_nice=${old_cpu_vals[1]}
cpu_old_system=${old_cpu_vals[2]}
cpu_old_idle=${old_cpu_vals[3]}
cpu_old_total=`echo "$cpu_old_user + $cpu_old_nice + $cpu_old_system + $cpu_old_idle" | bc`

cpu_vals_text=`cat /proc/stat  | head -1 | sed -e 's/^cpu[^0-9]*//g' -e 's/\([^ ]\+ [^ ]\+ [^ ]\+ [^ ]\+\).*/\1/g'`
cpu_vals=($cpu_vals_text)
cpu_user=${cpu_vals[0]}
cpu_nice=${cpu_vals[1]}
cpu_system=${cpu_vals[2]}
cpu_idle=${cpu_vals[3]}
cpu_total=`echo "$cpu_user + $cpu_nice + $cpu_system + $cpu_idle" | bc`
pcpu=`echo "(100 * ($cpu_system - $cpu_old_system + $cpu_user - $cpu_old_user)) / ($cpu_total - $cpu_old_total)" | bc`
echo $cpu_vals_text > "$CPUSTAT"
echo 0 widget_tell sbbottom g_cpu data cpu "$pcpu" | awesome-client
}

updateRed()
{
#RED=$[`(net-mon.perl;)`]  #con un script perl

#Ahora directamente con bash
REDin=$[`(~/bin/red_in.sh;)`]  #mi script
REDout=$[`(~/bin/red_out.sh;)`]  #mi script

echo "red_i: $REDin KBytes"  #por pantalla
echo "red_o: $REDout KBytes"

#IN=`grep wlan1 /proc/net/dev | sed 's/:/\ /' | awk '{print $2}'`
#OUT=`grep wlan1 /proc/net/dev | sed 's/:/\ /' | awk '{print $10}'`

echo 0 widget_tell sbbottom tbredin text $REDin | awesome-client
echo 0 widget_tell sbbottom tbredout text $REDout | awesome-client

#mandar datos a una progresbar
#echo 0 widget_tell sbbottom pbred data red1 $REDin | awesome-client
#echo 0 widget_tell sbbottom pbred data red2 $REDout | awesome-client

echo 0 widget_tell sbbottom g_red data red1 $REDin | awesome-client
echo 0 widget_tell sbbottom g_red data red2 $REDout | awesome-client
}

updateDisco()
{
	dusado=`df /dev/hda1 | awk '/\/dev\/hda1/ { print $5 }'`
	dusado2=`df /dev/hda6 | awk '/\/dev\/hda6/ { print $5 }'`
	echo 0 widget_tell sbbottom diskusage data part1 $dusado | awesome-client
	echo 0 widget_tell sbbottom diskusage data part2 $dusado2 | awesome-client
}

# programa principal
cont=0

while :
do
     updateClock
     updateMem
     updateCpu
     updateRed
     if [[ $cont -ne 120 && $cont -ne 0 ]]; then
      	let cont++
     else 
	      updateDisco
	      cont=1
     fi	  
     sleep 1
done



