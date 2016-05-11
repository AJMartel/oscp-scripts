#!/bin/bash

tcpdump -i tap0 -n -tttt "(dst $1 or src $1) and port $2"
#-X -s0
