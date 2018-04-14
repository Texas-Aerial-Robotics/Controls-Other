#!/bin/bash
 while [ 1 ]
 do
 cpu_temp=$(< /sys/class/thermal/thermal_zone1/temp)
 cpu_temp=$(($cpu_temp))
 ceclis=$(echo "scale=1; $cpu_temp / 1000" | bc | tr '\n\n\n' ',')
 sleep 20
 printf "$ceclis" >> templog.csv
 done
