#!/bin/bash
while [ 1 ]
do
./duo "\c5`date` load:`uptime | awk '{print $8}' | sed 's/,//'`\n \c4RPMS:`sensors | grep FAN | awk '{print $4}'`\n \c3MEMFREE: `top -n 1 | head -4 | tail -1 | awk '{print $6}'` k\n \c7PID %cpu Name       `ps aux --sort -c | head -2 | tail -1 | awk '{print $2" "$3" "$11}' | sed 's,/.*/,,'`\n \c2CPU `sensors | grep "CPU T" | awk '{print $3}'`\n \n \c12\c20\c31\c46 \c5M\c6a\c7y\c1o\c2r \c3B\c4o\c5b\c6s\c7t\c1e\c2r"
sleep 1
done
