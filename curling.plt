set terminal svg dynamic font "Courier,12" linewidth 1 background "white"
set datafile sep '\t'
set output "curling.svg"

unset key
unset xtics
unset ytics
unset border

# Origin at pin, 1:1 ratio
set xrange [-20:20]
set yrange [-18:22]
set size square

set parametric
set trange [0:1]

# angle/distance order with angle in degrees (0 is due east, 90 is due north...) and distance from pin to center of stone (in feet)
$RED << EOD
16	3.53872834319479
141	5.97511606230271
134	3.65983079830079
36	5.48927955799126
94	1.77147051164867
253	0.692094640216335
13	6.91072140399425
125	6.92749717661407
EOD

$YELLOW << EOD
288	7.3888454061347
198	5.00041151282133
250	1.7506361269895
22	5.23668147011163
6	2.2713589431563
336	6.38780061026817
128	0.98987436787031
320	1.04340773977904
EOD

# stones have 11-inch diameter and smaller colored top
plot (t*(15+7/12.0)-((15+7/12.0)/2.0)),(21) with lines lc rgbcolor "red" lw 4 dt 1 title "Hog Line",\
	(-7-9.5/12.0),(t*40-18) with lines lc rgbcolor "black" lw 1 title "Boundary",\
	(7+9.5/12.0),(t*40-18) with lines lc rgbcolor "black" lw 1 title "Boundary",\
	(t*(15+7/12.0)-((15+7/12.0)/2.0)),(-18) with lines lc rgbcolor "black" lw 1 title "Boundary",\
	(t*(15+7/12.0)-((15+7/12.0)/2.0)),(-6) with lines lc rgbcolor "black" lw 1 title "Back Line",\
	$RED using (0):(0):(0) with circles fs pattern notitle,\
	"" using (0):(0):(6) with circles lc rgbcolor "red" fs pattern title "12-Foot Circle",\
	"" using (0):(0):(4) with circles lc rgbcolor "white" fs pattern title "8-Foot Circle",\
	"" using (0):(0):(2) with circles lc rgbcolor "blue" fs pattern title "4-Foot Circle",\
	(4*cos(t*2.0*pi)),(4*sin(t*2.0*pi)) with lines lc rgbcolor "red" lw 1 title "4-Foot Circle",\
	(0),(t*40-6) with lines lc rgbcolor "black" lw 1 title "Center Line",\
	(t*(15+7/12.0)-((15+7/12.0)/2.0)),(0) with lines lc rgbcolor "black" lw 1 title "Tee Line",\
	(t*2-1),(-12) with lines lc rgbcolor "black" lw 1 title "Hack",\
	$RED using (0):(0):(0.5) with circles lc rgbcolor "gray" fs solid title "Button",\
	"" using (0):(0) with points pt 7 ps 0.1 lc rgbcolor "black" title "Pin",\
	"" using ($2*cos($1/180.0*pi)):($2*sin($1/180.0*pi)):(11.0/12.0/2.0) with circles fs solid fc rgbcolor "black" title "Red Stone",\
	"" using ($2*cos($1/180.0*pi)):($2*sin($1/180.0*pi)):(11.0/12.0/3.0) with circles fs pattern fc rgbcolor "red" title "Red Stone",\
	$YELLOW using ($2*cos($1/180.0*pi)):($2*sin($1/180.0*pi)):(11.0/12.0/2.0) with circles fs solid fc rgbcolor "black" title "Yellow Stone",\
	"" using ($2*cos($1/180.0*pi)):($2*sin($1/180.0*pi)):(11.0/12.0/3.0) with circles fs pattern fc rgbcolor "yellow" title "Yellow Stone"