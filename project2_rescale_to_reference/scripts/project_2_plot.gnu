set terminal pngcairo enhanced size 900,600 font "sans,12"

# Specify the filename where the image will be saved
set output "./fragment_length_distribution_rescaled_data.png"


set title "Fragment Length Distribution"
set xlabel "Fragment Length (bp)"
set ylabel "Normalized Frequency"
set grid

ref_file  = (exists("ARG1") && ARG1 ne "") ? ARG1 : "./data/reference.hist"
resc_file = (exists("ARG2") && ARG2 ne "") ? ARG2 : "./outputs/rescaled.hist"

plot ref_file using 1:2 title "Reference" with lines lw 2, \
     resc_file using 1:2 title "Rescaled" with points pt 7 ps 1.5


unset output
