#!/bin/bash

fill=0000
for ((T = 0; T < 1401; T+=50))
do
	echo ${T}
	n=${fill}${T}
	padcount=${n: -4}
	gnuplot -e "filename='/home/sr4871/PhD/materials/mn2au/domain_walls/shortrange_0_30_cutoff/run3/processed/ndw_T_${padcount}.dat'" tanh_fitter.plt
	#gnuplot -e "filename='/home/sr4871/PhD/materials/mn2au/domain_walls/ASD/new_with_ani/run1/processed/ndw${padcount}.txt'" cosh_fitter.plt
done

