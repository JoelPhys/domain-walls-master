set fit quiet

f(x) = c*tanh((x-a)/b)

a = 0.6e-9
b = -0.6e-7
c = 1.0

FIT_LIMIT = 1E-10;

fit [1e-10:2.66e-7] f(x) "/home/sr4871/PhD/materials/mn2au/domain_walls/ASD/new_with_ani/average/avg0500.txt" u 1:2 via a,b,c


set terminal epslatex
set output "dw1.tex"
set ylabel "$M / M_S$"
set xlabel "Distance (nm)"
set xrange [0:250]
plot "/home/sr4871/PhD/materials/mn2au/domain_walls/ASD/new_with_ani/average/avg0500.txt" every 5::2 u ($1/1e-9):2 pt 6 ps 2 lw 2 lc "red" title 'ASD', \
f(x*1e-9) w l lw 4 lc "blue" title 'fit'

pause -1
