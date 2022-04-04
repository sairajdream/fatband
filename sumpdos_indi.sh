#!/bin/bash
#For spin polarized calc you may have el as el1 and el2 in that case enter el* and at the place of elename enter el"
ele=Si
elename=Si

#-----------------------------------------------
# sumpdos s-orbitals individually 
#-----------------------------------------------

# let us Keep the first column E(ev) as it is and sum other colums with different files(same column)
# E (eV)  ldosup(E)  ldosdw(E) pdosup(E)  pdosdw(E)
awk '{
    a[FNR]=$1      # E(ev) 
    b[FNR]+=$2     # ldos-up
    c[FNR]+=$3     # ldos-dn
    d[FNR]+=$4     # sx-up
    e[FNR]+=$5     # sx-dn
}
END {
    for (i=1; i<=FNR; i++) 
        print a[i], b[i], c[i], d[i], e[i] 
}' *\($ele\)*\(s\)* >> sum-atom-$elename-s.dat 
< sum-atom-$elename-s.dat column -t > atom-$elename-s.dat
rm sum-atom-$elename-s.dat


#-----------------------------------------------
# sumpdos p-orbitals individually 
#-----------------------------------------------

# let us Keep the first column E(ev) as it is and sum other colums with different files(same column)
# E (eV)  ldosup(E)  ldosdw(E) pdosup(E)  pdosdw(E)  pdosup(E)  pdosdw(E)  pdosup(E)  pdosdw(E)  pdosup(E)  pdosdw(E)  pdosup(E)  pdosdw(E)
awk '{
    a[FNR]=$1      # E(ev) 
    b[FNR]+=$2     # ldos-up
    c[FNR]+=$3     # ldos-dn
    d[FNR]+=$4     # pz-up
    e[FNR]+=$5     # pz-dn
    f[FNR]+=$6	   # px-up
    g[FNR]+=$7	   # px-dn
    h[FNR]+=$8	   # py-up
    I[FNR]+=$9     # py-dn	
}
END {
    for (i=1; i<=FNR; i++) 
        print a[i], b[i], c[i], d[i], e[i], f[i], g[i], h[i], I[i]
}' *\($ele\)*\(p\)* >> sum-atom-$elename-p.dat 
< sum-atom-$elename-p.dat column -t > atom-$elename-p.dat
rm sum-atom-$elename-p.dat
