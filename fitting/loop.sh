#!/bin/bash

fill=0000
for ((T = 0; T < 1500; T+=100))
do
	n=${fill}${T}
	padcount=${n: -4}
	gnuplot -e "filename='../data/dw${padcount}.dat'" fitter.plt

done

