Efermi = 6.3296
eV='eV'
set term postscript eps enhanced color
set output 'Si-px-fatbpdos-spin-up.eps'
set multiplot

xmin=0.0000 ; xmax=3.2802
ymin=-6 ; ymax=16

# list of high symm. points and their values 
K1=0.0000
K2=0.8660
K3=1.8660
K4=2.2196
K5=3.2802

#set label 1 sprintf("E_F= %.4f%s", Efermi, eV) at graph 0.45, 0.6 center tc rgb '#800000'


set nokey
set title offset 5,0 "Orbital projected bands and Projected density of states of silicon" font "Times-Roman, 18.0" tc rgb 'black'
set size 0.8,1.0
#set size 0.4,0.5
set rmargin 0
set xrange [0.0000:3.2802]
set yrange [-6:16]

# list of X-tics at high symm. points
set arrow from K1, -6 to K1, 16 nohead lt 5 lw 1 lc rgb "black" 
set arrow from K2, -6 to K2, 16 nohead lt 5 lw 1 lc rgb "black" 
set arrow from K3, -6 to K3, 16 nohead lt 5 lw 1 lc rgb "black" 
set arrow from K4, -6 to K4, 16 nohead lt 5 lw 1 lc rgb "black" 
set arrow from K5, -6 to K5, 16 nohead lt 5 lw 1 lc rgb "black" 

set xzeroaxis  lc rgb '#800000'

set ylabel 'E - E_F (eV)' font "Times-Roman, 14"
set xtics ('L' 0.0000, '{/Symbol G}' 0.8660, 'X' 1.8660, 'U' 2.2196, '{/Symbol G}' 3.2802)
set ytics -6,2,16 font 'Helvetica, 12'



p [] []\
'bands.dat.gnu' u 1:($2-Efermi) title 'all' w l lw 0.8 lc '#C4C3C3',\
'Si_pz.dat.all' using 1:($2-Efermi):3 title 'pz' w points pt 7 ps var lt rgb '#8C3F0D',\
'Si_px.dat.all' using 1:($2-Efermi):3 title 'px' w points pt 7 ps var lt rgb '#FD0233',\
'Si_py.dat.all' using 1:($2-Efermi):3 title 'py' w points pt 7 ps var lt rgb '#65129B'

# To plot DOS along with bands

set title " "

set origin 0.8,0.0
set xzeroaxis lc rgb '#800000'
unset label 1
set lmargin 0.5
set size 0.15,1.0
set xr[0:1]
set yr[-6:16]
set noarrow
set ytics nomirror
set xtics ( " " 0)
set noylabel
set key title offset -2,-0.5 "Si(p-orb)\n" 
#set key reverse samplen 1
set key at 1.0, 16
#set key spacing 4
#set key font ",8"
set key samplen 1.5

# 4,5=dz2; 6,7=dzx; 8,9=dzy; 10,11=dx2-y2; 12,13=dxy; t2g=dxy+dyz+dxz; eg=dx2-y2+dz2

##pz
# p [] []\
# 'atom-Si-p.dat' u 3:($1-Efermi) notitle w filledcurve y1=0 lt rgb '#F58231',\
# 'atom-Si-p.dat' u 3:($1-Efermi) title "p_z" w l lw 1.0 lt 6 lc rgb '#8C3F0D'
##px
 p [] []\
 'atom-Si-p.dat' u 4:($1-Efermi) notitle w filledcurve y1=0 lt rgb '#FE6280',\
 'atom-Si-p.dat' u 4:($1-Efermi) title "p_x" w l lw 1.0 lt 6 lc rgb '#FD0233'
##py
# p [] []\
# 'atom-Si-p.dat' u 5:($1-Efermi) notitle w filledcurve y1=0 lt rgb '#B764ED',\
# 'atom-Si-p.dat' u 5:($1-Efermi) title "p_y" w l lw 1.0 lt 6 lc rgb '#65129B'

#pause -1

