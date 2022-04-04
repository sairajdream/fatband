#!/bin/bash

# it will do the plotband.x calculation for p-orbital 
# if your qe bin directory path is not exported in the bashrc file
# please provide full path of plotband.x below


# NOTE:
# You need to add the 2nd column values of select.sh output in place of for loop vales


Fermi=$(awk '/Fermi/{ print $5;exit }' scf.out)
ele='Si'

#----------------------------------------------------

o1=pz

for i in 2 6 
do
   cat > $ele.p.$o1.$i.in << EOF
bands.dat
$i
-20.00000 20.00000
$ele.p.$o1.$i.bands.gnu
$ele.p.$o1.$i.bands.ps
$Fermi
1.0 $Fermi
EOF

plotband.x < $ele.p.$o1.$i.in

done


#----------------------------------------------------

o2=px
for i in 3 7
 do
   cat > $ele.p.$o2.$i.in << EOF
bands.dat
$i
-20.00000 20.0000000
$ele.p.$o2.$i.bands.gnu
$ele.p.$o2.$i.bands.ps
$Fermi
1.0 $Fermi
EOF

plotband.x < $ele.p.$o2.$i.in

done


#----------------------------------------------------

o3=py
for i in 4 8
 do
   cat > $ele.p.$o3.$i.in << EOF
bands.dat
$i
-20.00000 20.0000000
$ele.p.$o3.$i.bands.gnu
$ele.p.$o3.$i.bands.ps
$Fermi
1.0 $Fermi
EOF

plotband.x < $ele.p.$o3.$i.in

done

#-----------------------------------------------------

