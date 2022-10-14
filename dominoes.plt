set terminal svg dynamic font "Courier,12" linewidth 1 background "white"
set datafile sep '\t'
set output "dominoes.svg"

unset xtics
unset ytics
unset border
unset key

set xrange [-1:5]
set yrange [6:0]
set size square

# Unicode values for dominoes in a Double 3 set
$DOMINOES << EOD
"1F031"	1	1
"1F032"	2	1
"1F033"	3	1
"1F034"	4	1
"1F039"	5	1
"1F03A"	1	2
"1F03B"	2	2
"1F041"	3	2
"1F042"	4	2
"1F049"	5	2
EOD

# Unicode values for horizontal/vertical blank dominoes
$SPACES << EOD
"1F031"	1	3
"1F031"	1	4
"1F063"	2	2.75
"1F063"	3	2.75
"1F063"	4	2.75
"1F031"	5	3
"1F031"	5	4
"1F063"	2	4.25
"1F063"	3	4.25
"1F063"	4	4.25
EOD

set parametric
set trange [0:1]

plot $DOMINOES using 3:2:(sprintf( "\U+%s" , stringcolumn( 1 ))) with labels font "Courier,72" title "Dominoes",\
	$SPACES using 3:2:(sprintf( "\U+%s" , stringcolumn( 1 ))) with labels font "Courier,72" title "Ring",\
	"" using (1.5):(0.5):("Dominoes") with labels notitle,\
	"" using (3.5):(0.5):("Ring") with labels notitle,\
	(4.99/2.0),(t*7) with lines lc rgbcolor "black" lw 0.5 lt 1 title "Divider"