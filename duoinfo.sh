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
LOAD=`cat /proc/loadavg | cut -d' ' -f1`
TOPROC=`ps aux --sort -c | head -2 | tail -1 | awk '{print $11}' | sed 's,^.*/,,'`
TOPROCID="`ps aux --sort -c | head -2 | tail -1 | awk '{print $2" "$3}'`"
FREEMEM=`top -n 1 | head -4 | tail -1 | awk '{print $6}'`
CPU=`sensors | grep "CPU T" | awk '{print $3}'`
CPUT=`sensors | grep "CPU T" | awk '{print $3}' | sed 's,+,,' | sed 's,\.[0-9].*,,'`
if [ $CPUT -lt 40 ]
then
COLOR=00FFFF
LENGTH=50
fi
if [ $CPUT -gt 40 ]
then
COLOR=40FF00
LENGTH=100
fi
if [ $CPUT -gt 45 ]
then
COLOR=FFFF00
LENGTH=150
fi
if [ $CPUT -gt 50 ]
then
COLOR=FFBF00
LENGTH=200
fi
if [ $CPUT -gt 55 ]
then
COLOR=FF8000
LENGTH=250
fi
if [ $CPUT -gt 60 ]
then
COLOR=FF0000
LENGTH=300
fi
FANLENGTH=`sensors | grep IS2 | awk '{print $4}'`
FANLENGTH=`expr $FANLENGTH \- 917`
FANBAR="\c7\b0,$FANLENGTH,56,57,"
CPUBAR="\a$COLOR\b5,$LENGTH,160,162,"
RPMS=`sensors | grep FAN | awk '{print $4}'`
BANNER="\c12\c20\c31\c46 \c5M\c6a\c7y\c1o\c2r \c3B\c4o\c5b\c6s\c7t\c1e\c2r"
./duo "\c5`date` \caload:$LOAD\n\c4RPMS:$RPMS$FANBAR\n\c3MEMFREE: $FREEMEM k\n\c7PID  %cpu Name\n\c6$TOPROCID $TOPROC\n\c2CPU $CPU\n$CPUBAR\n$BANNER"
sleep 1
done
