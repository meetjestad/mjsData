#!/usr/bin/gnuplot -persist
# mjs_boom_0081_m_02w.plt

set style data lines
set grid front
set key left top
set key font ",16"
set terminal pngcairo size 1920,480 transparent
set output "../png/mjs_boom_0081_m_02w.png"
set xdata time
set timefmt "%Y-%m-%d.%H:%M:%S"
set format x "     %d\n       %b"
set autoscale xfix
#set autoscale y
set xtics 86400
set mxtics 4
set xtics font ", 18"
set ytics font ", 18"
set ytics nomirror
set y2tics nomirror
set ytics  font ", 18" textcolor rgbcolor "#7F7F7F" 
set y2tics font ", 18" textcolor rgbcolor "#FFA500"
set grid xtics ytics
set pointsize 0.1
set boxwidth 120
set style fill transparent solid 0.10 noborder


# First line is dummy to line up KNMI and own timescales with each other:
plot \
   "< cat ../lst/mjs_boom_0081_ca_02w.lst"    using 1:('?') title ''                     axis x1y2        lw 0   lc rgbcolor '#FFFFFF'  dt 1      , \
   "< cat ../../knmi/lst/knmi_thdrs_02w.lst"  using 1:($7)  title '    Sunshine KNMI >'  axis x1y2  w lp  lw 12  lc rgbcolor '#FFA500'  dt 1  pt 3, \
   "< cat ../../knmi/lst/knmi_thdrs_02w.lst"  using 1:($6)  title '< 7-day rain KNMI  '  axis x1y1  w lp  lw 12  lc rgbcolor '#BFBFBF'  dt 1  pt 3, \

