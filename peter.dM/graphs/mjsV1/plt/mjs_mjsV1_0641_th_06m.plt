#!/usr/bin/gnuplot -persist
# mjs_mjsV1_0641_th_06m.plt

set style data lines
set grid front
set key left top
set key font ", 18"
set key opaque
set terminal png size 1920,480 transparent
set output "../png/mjs_mjsV1_0641_th_06m.png"
set xdata time
set timefmt "%Y-%m-%d.%H:%M:%S"
set format x "       %b\n     %y"
set autoscale xfix
set xtics 2592000
set mxtics 4
set xtics font ", 18"
set ytics  nomirror
set y2tics nomirror
set ytics  font ", 18" textcolor rgb "red" 
set y2tics font ", 18" textcolor rgb "blue" 
set grid xtics ytics
set boxwidth 60
set style fill transparent solid 0.10 noborder


plot \
   "< cat ../lst/mjs_mjsV1_0641_th_06m.lst"   using 1:($4)  title '          humidity >'  axis x1y2  lt 2  lw 2  lc rgbcolor '#0000FF', \
   "< cat ../lst/mjs_mjsV1_0641_th_06m.lst"   using 1:($3)  title '< temperature       '  axis x1y1  lt 1  lw 2  lc rgbcolor '#FF0000', \

   #"< cat ../../knmi/lst/knmi_thdrs_06m.lst"  using 1:($2)  title '< KNMI temperature  '  axis x1y1  lt 1  lw 6  lc rgbcolor '#FFCFCF', \
   #"< cat ../../knmi/lst/knmi_thdrs_06m.lst"  using 1:($3)  title '     KNMI humidity >'  axis x1y2  lt 2  lw 6  lc rgbcolor '#CFCFFF', \
