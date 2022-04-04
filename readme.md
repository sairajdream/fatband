The following instruction is written with the help of [bryanalchemist fatband instruction](https://github.com/bryanalchemist/MS_Research21/tree/main/NbS2/fatbands). 

**Pros :** You can plot the fatband along with pdos.

**Cons:** More time consuming than bryanalchemist fatband instruction.

### Example-1 Silicon fatband with pdos
### To plot Fatband with DOS we need to do following calculations.
1. scf calculations
	```
	pw.x -in scf.in > scf.out
	```
2. bands calculations
	```
	pw.x -in bands.in > bands.out
	```
3. bands.x calculations
	```
	bands.x -in band.in > band.out
	```
4. projwfc.x calculation
	```
	projwfc.x -in pdos.in > pdos.out
	```
5. nscf calculations (tetrahedra with dense k points)
	```
	pw.x -in nscf.in > nscf.out
	```
6. dos calculations
	```
	dos.x -in dos.in > dos.out
	```
	
### Post-Processing step-1 : PDOS 
7. Sumpdos orbitals (Together): it will sum all the orbital together e.g. P_orbital.
```
	./sumpdos_tog.sh
```
8. Sumpdos orbitals  (individual) : it will sum orbitals individually e.g. px py pz.
```
	./sumpdos_indi.sh
```

### Post-Processing step-2: Fatband with PDOS
9. Make a soft link of projwfc calc ( required for plotband.x )
```
	ln -s *up bands.dat.proj
```
10. To list all the valence electron of element edit the list.sh script for each element and run
```
	./list.sh
```
11. From the above steps we can select specific orbitals e.g. s, p, d, f. We need to run the select.sh script for each orbital mentioned in the output of list.sh. 
```
	./select.sh
```
12. use the 1st column of select.sh output as a 2nd row input for plotband input and then run plotband script for each orbital e.g. for p orbital
```
	./plotband_p_orb.sh
```
13. Above steps will create too many output files it is better to create individual directory and subdirectory for each element and respective orbitals e.g. s p and d_band. After this we need to copy some important files to each directory. then use the sumplot.sh script to some all the orbitals.
```
cp sumplot.sh atom-* sum-ud-* dos.dat nscf.in scf.out bands.in 
band.out bands.dat.gnu /home/sai/fatband/silicon/s_band	

cp sumplot.sh atom-* sum-ud-* dos.dat nscf.in scf.out bands.in band.out bands.dat.gnu /home/sai/fatband/silicon/p_band

cp sumplot.sh atom-* sum-ud-* dos.dat nscf.in scf.out bands.in band.out bands.dat.gnu /home/sai/fatband/silicon/p_band/px

cp sumplot.sh atom-* sum-ud-* dos.dat nscf.in scf.out bands.in band.out bands.dat.gnu /home/sai/fatband/silicon/p_band/py

cp sumplot.sh atom-* sum-ud-* dos.dat nscf.in scf.out bands.in band.out bands.dat.gnu /home/sai/fatband/silicon/p_band/pz

./sumplot.sh
```
14. Plot the all and individual bands with the help of gnuplot given.
```
gnuplot p-all-gnufatpdos.gp
gnuplot pxgnufatpdos.gp
gnuplot sgnufatpdos.gp
```   
