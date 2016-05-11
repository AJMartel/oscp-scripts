#!/bin/bash

while [ "true" ]
do
    VPNCON=$(nmcli con | grep tap0)
    if [[ $VPNCON ]]; then
        VPNCON=$(echo $VPNCON | cut -f 1 -d " ")
    else
        echo "No connection, attempting to (re)connect"
        openvpn #/path/to/connection.conf
    fi
    sleep 30 
done
