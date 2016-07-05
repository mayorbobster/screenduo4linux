#!/bin/bash
xwidth=8
ywidth=8
color=0
x=0
y=0
xmax=`expr 310 \- $xwidth`
ymax=`expr 231 \- $ywidth`
xmin=`expr $xwidth \+ 4`
ymin=`expr $ywidth \+ 4`
xdirection=1
ydirection=1
while [ 1 ]
do
    a=$x
    b=`expr $x \+ $xwidth`
    c=$y
    d=`expr $y \+ $ywidth`
   ./duo "\c$color\b$a,$b,$c,$d,"
    x=`expr $x \+ $xwidth \* $xdirection`
    y=`expr $y \+ $xwidth \* $ydirection`

if [ $x -gt $xmax ]
then
xdirection=`expr $xdirection \* -1`
color=`expr $color + 1`
fi

if [ $y -gt $ymax ]
then
ydirection=`expr $ydirection \* -1`
color=`expr $color + 1`
fi

if [ $x -lt 1 ]
then
xdirection=`expr $xdirection \* -1`
color=`expr $color + 1`
fi

if [ $y -lt 1 ]
then
ydirection=`expr $ydirection \* -1`
color=`expr $color + 1`
fi

if [ $color -gt 7 ]
then
color=0
fi
done
