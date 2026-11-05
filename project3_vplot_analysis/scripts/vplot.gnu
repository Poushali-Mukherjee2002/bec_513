set terminal pngcairo size 1000,700 font "Arial,14"
set output "./vplot1.png"

set xlabel "Offset from anchor centre (bp)"
set ylabel "Fragment length (bp)"
set cblabel "Fragment count"
set xrange [-500:500]
set yrange [65:200]

# Adjusted colorbar range to maximize contrast on your peak signal
set cbrange [10:150]

# High-contrast Classic Blue-to-Red Palette
set palette defined ( \
    0.0 "#000090", \
    0.2 "#000fff", \
    0.4 "#00ffff", \
    0.6 "#ffff00", \
    0.8 "#ff0000", \
    1.0 "#800000" \
)

set view map
unset key
input_file = (exists("ARG1") && ARG1 ne "") ? ARG1 : "./outputs/real_data_vplot.tsv"

splot input_file using 1:2:3 with pm3d

