#!/bin/bash
DOMAIN=$1
dig NS $DOMAIN +short |
sed -e "s/\.$//g" |
while read nameserver;
do
    echo "Testing $DOMAIN @ $nameserver";
    dig AXFR $DOMAIN "@$nameserver";
done

