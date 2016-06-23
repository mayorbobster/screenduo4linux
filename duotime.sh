#!/bin/bash
USER=`whoami`
if [ $USER != 'root' ];
then
echo You must be root to run this script!
exit
fi

while [ 1 ]
do
./duo "`date | cut -d' ' -f4,5,6,7`"
sleep .3 
done
