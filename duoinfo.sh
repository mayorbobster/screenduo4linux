#!/bin/bash
while [ 1 ]
do
./duo "`date` load:`uptime | awk '{print $8}' | sed 's/,//'`\nRPMS:`sensors | grep FAN | awk '{print $4}'`\nMEMFREE: `top -n 1 | head -4 | tail -1 | awk '{print $6}'` k\nPID %cpu Name       `ps aux --sort -c | head -2 | tail -1 | awk '{print $2" "$3" "$11}' | sed 's,/.*/,,'`\nCPU `sensors | grep "CPU T" | awk '{print $3}'`"
sleep 1
done
