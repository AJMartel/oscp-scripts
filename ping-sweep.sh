#!/bin/bash

#ip=`ifconfig tap0 | grep "inet " | sed 's/^ *//' | cut -d " " -f 2`
#o1=`echo $ip | cut -d "." -f 1`
#o2=`echo $ip | cut -d "." -f 2`
#o3=`echo $ip | cut -d "." -f 3`
#range="$o1.$o2.$o3"
range=$1
echo "$range.*"
echo ""
for i in $(seq 1 255); do
    ping -c 1 -W 1 "$range.$i" | grep "from" | cut -d " " -f 4 | cut -d ":" -f 1 &
    sleep .03
done;
