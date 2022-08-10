#!/usr/bin/gnuplot -persist
# mjs_greenroof_2086_hu_02w.plt

set style data lines
set grid front
set key left top
set key font ",16"
set terminal pngcairo size 1920,480 transparent
set output "../png/mjs_greenroof_2086_hu_02w.png"
set xdata time
set timefmt "%Y-%m-%d.%H:%M:%S"
set format x "     %d\n       %b"
set autoscale xfix
set xtics 86400
set mxtics 4
set xtics  font ", 18"
set ytics  nomirror
set y2tics nomirror
set ytics  font ", 18" textcolor rgbcolor "#7F7F7F" 
set y2tics font ", 18" textcolor rgbcolor "#007F00" 
set grid xtics ytics
set pointsize 0.1
set boxwidth 120
set style fill transparent solid 0.10 noborder


plot \
   "< cat ../../knmi/lst/knmi_thdrsR_260_02w.lst"  using 1:($6)  title '<  7-day rainfall (KNMI) '  axis x1y1  w lp  lw 12  lc rgbcolor '#BFBFBF'        pt 3, \
   "< cat ../lst/mjs_greenroof_2086_ca_02w.lst"    using 1:($4)  title '        roof humidity % >'  axis x1y2  w lp  lw 2   lc rgbcolor '#007F00'  dt 1  pt 7 ps 0.5

