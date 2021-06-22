set fit quiet

f(x) = c*tanh((x-a)/b)

a = 0.6e-8
b = -8e-9

FIT_LIMIT = 1E-10;

fit f(x) filename u 1:2 via a,b,c

plot filename u 1:2 pt 6 ps 2 lw 1 lc "red"
replot f(x) w l lw 2 lc "black"

pause -1
