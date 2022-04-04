#!/bin/sh
#This program will search for lines in **.val.list that match suborbitals
# just open periodic table and check the electronic configuration..
# last value will tell you the valence orbital information
# eg. Bi [Xe] 4f14 5d10 6s2 6p3  ---> therefor we need to run this script for 
# l=3, l=2, l=1 and l=0 for f,d,p and s orbital respectively
#------------------------------------------------------------------

El='Si'
l=1    #for s, l=0; for p, l=1; for d, l=2
mm=3   #for l=0 m=1; l=1 m=3; l=2 m=5; l=3 m=7

for i in $(seq 1 $mm)
do
m=$i #m param based on QE output
#for l=1:
#   1   pz
#   2   px
#   3   py
#for l=2
#   1   dz2
#   2   dzx
#   3   dzy
#   4   dx2-y2
#   5   dxy
echo "$i"  ; awk '$6=='$l' && $7=='$m'' $El.val.list
done

