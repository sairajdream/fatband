#!/bin/bash

echo "
---------------------------------------------------
You need to manually check the list of elements
and respective orbitals before running this script
----------------------------------------------------
"


# this script will sum all the orbitals
sum="/home/sai/1apps/qe6.7/bin/sumpdos.x"

# list of elements
el1=Si


#-------------------------------------------------
# sumpdos for el1 : P-orbital
$sum  *\($el1\)*\(s\)  >sum-ud-atom_${el1}_s.dat
$sum  *\($el1\)*\(p\)  >sum-ud-atom_${el1}_p.dat
$sum  *\($el1\)*       >sum-ud-atom_${el1}-total.dat

