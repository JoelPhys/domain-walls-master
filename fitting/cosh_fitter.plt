set fit quiet

a = 0.25
b = 1e-8
c = 2e-8

f(x) = a * (cosh((x-b)/c))**-1

FIT_LIMIT = 1E-10

fit f(x) filename using 1:(abs($3)) via a,b,c

plot filename u 1:(abs($3)) pt 6 ps 2 lw 1 
replot f(x) w l lw 2 lc "blue"

print abs(c)
pause -1
