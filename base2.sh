#!/bin/bash

# converts binary to decimal
echo "ibase=2; $1" | bc
