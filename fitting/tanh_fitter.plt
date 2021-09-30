set fit quiet

f(x) = c*tanh((x-a)/b)

a = 1e-9
b = -1e-7
c = 1.0

FIT_LIMIT = 1E-10;

fit [1e-10:1.65e-7] f(x) filename u 1:2 via a,b,c

plot filename u 1:2 pt 6 ps 2 lw 1 lc "red"
replot f(x) w l lw 2 lc "blue"


print abs(b)
pause -1
