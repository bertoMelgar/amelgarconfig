#!/usr/bin/perl -w 
 
# Nota: estos dos parametros puede introducirlos el usuario 
# en la linea de comandos, por este orden, sobreescribiendo 
# los valores por defecto para esa ejecución. 
  
$def_int="wlan0"; # interface que analizamos por defecto 
#$def_sca=500;    # escala del grafico por defecto 
 
# Lo que viene a continuación no deberia ser modificado 
# por los usuarios normales. De todas formas yo nunca 
# dejaria que me llamasen usuario normal ]:-) 
 
$pnd="/proc/net/dev"; 
$int=($ARGV[0])?($ARGV[0]):($def_int); 
$seg=1; 
$kil=1000; 
$kps=$kil*$seg; 
#$sca=($ARGV[1])?($ARGV[1]):($def_sca); 
  
# Función que obtiene el numero total de bytes recibidos 
# por el interface 
  
sub getbytes 
{ 
        open (PND, "<$pnd"); 
        while(<PND>) { 
                if(/\s*$int:\s*(\d+)\s*/) { 
                        return $1; 
                } 
        } 
        close PND; 
} 
  
# Programa principal 
  
#print "Esto analiza $pnd a intervalos de $seg segundo(s) "; 
#print "y para cada intervalo\n"; 
#print "calcula la velocidad de bajada por el $int "; 
#print "en KiloBytes/segundo\n"; 
  
$x=&getbytes; 
        
sleep $seg; 
$z=($y=&getbytes)-$x; 
printf("%1.f \n", $z/$kps); 

$x=$y; 

