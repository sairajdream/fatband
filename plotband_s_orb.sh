#!/bin/bash

# it will do the plotband.x calculation for p-orbital 
# if your qe bin directory path is not exported in the bashrc file
# please provide full path of plotband.x below


# NOTE:
# You need to add the 1st column values of select.sh output in place of for loop vales


Fermi=$(awk '/Fermi/{ print $5;exit }' scf.out)
ele='Si'

#----------------------------------------------------

o1=x

for i in 1 5
do
   cat > $ele.s.$o1.$i.in << EOF
bands.dat
$i
-20.00000 20.00000
$ele.s.$o1.$i.bands.gnu
$ele.s.$o1.$i.bands.ps
$Fermi
1.0 $Fermi
EOF

plotband.x < $ele.s.$o1.$i.in

done
