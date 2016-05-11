#!/usr/bin/python3

import os
import time
from subprocess import Popen, DEVNULL
from sys import argv

p = {} # ip -> process
for n in range(1, 255): # start ping processes
#    ip = "192.168.###.{}".format(n)
    ip = "{}.{}".format(argv[1], n)
    p[ip] = Popen(['ping', '-n', '-w5', '-c3', ip], stdout=DEVNULL)
    #NOTE: you could set stderr=subprocess.STDOUT to ignore stderr also

while p:
    for ip, proc in p.items():
        if proc.poll() is not None: # ping finished
            del p[ip] # remove from the process list
            if proc.returncode == 0:
                print(ip)
            elif proc.returncode == 1:
                pass
            else:
                print('%s error' % ip)
            break
