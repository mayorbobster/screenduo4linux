#!/bin/bash

USER=`whoami`
if [ $USER != 'root' ];
then
echo You must be root to run this script!
exit
fi


while [ 1 ]
do
TODAY=`date`
LOAD=`uptime | sed 's,^.*average: ,,' | sed 's/,.*//'`
TOPROC=`ps aux --sort -c | head -2 | tail -1 | awk '{print $11}' | sed 's,^.*/,,'`
TOPROCID="`ps aux --sort -c | head -2 | tail -1 | awk '{print $2" "$3}'`"
FREEMEM=`top -n 1 | head -4 | tail -1 | awk '{print $6}'`
CPU=`sensors | grep "CPU T" | awk '{print $3}'`
RPMS=`sensors | grep FAN | awk '{print $4}'`
BANNER="\c12\c20\c31\c46 \c5M\c6a\c7y\c1o\c2r \c3B\c4o\c5b\c6s\c7t\c1e\c2r"
./duo "\c5`date` \caload:$LOAD\n\c4RPMS:$RPMS\n\c3MEMFREE: $FREEMEM k\n\c7PID %cpu Name\n\c6$TOPROCID $TOPROC\n\c2CPU $CPU\n\n$BANNER"
sleep 1
done
