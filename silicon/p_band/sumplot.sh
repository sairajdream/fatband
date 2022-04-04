#!/bin/sh
#Make sure other orbital data are not present
Element='si'
orb='s'
########################################################
desired_filname=$Element'_'$orb'.dat.all'
datfile=*.gnu*[0-9]
for filgnu in $datfile;
do
    cat $filgnu >> $desired_filname
    echo "\n" >>$desired_filname
done
rm *.gnu*[0-9]

