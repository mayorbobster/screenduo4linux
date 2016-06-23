#!/bin/bash
USER=`whoami`
if [ $USER != 'root' ];
then
echo You must be root to run this script!
exit
fi

./duo "Color Picker\n \c1(1)\c2(2)\c3(3)\c4(4)\c5(5)\c6(6)\n \c7(7)\c9(9)\ca(a)\cb(b)\cc(c)\cd(d)\n \ce(e)\c1 \n(8) is black (erase) "
