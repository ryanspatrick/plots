set terminal svg dynamic font "Courier,12" linewidth 1 background "white"
set datafile sep ':'
set output "clock.svg"

unset key
unset xtics
unset ytics
unset border

set xrange [-1:1]
set yrange [-1:1]
set size square

# scale/offset t as needed
set parametric
set trange [0:1]

$HOURS << EOD
1
2
3
4
5
6
7
8
9
10
11
12
EOD

$MINUTES << EOD
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
EOD

$TIME << EOD
05:10:19
EOD

mymod( v , m ) = ( v > m )?( v - m ):( v )
angle( v , u ) = mymod( 5.0 * pi / 2.0 - v / u * 2.0 * pi , 2.0 * pi )

# calculate angles for hours/minutes/seconds hands
hours(h,m,s) = angle( h + m / 60.0 + s / 3600.0 , 12 )
minutes(h,m,s) = angle( m + s / 60.0 , 60 )
seconds(h,m,s) = angle( s , 60 )

plot cos(t*2.0*pi),sin(t*2.0*pi) with lines lc rgbcolor "black" notitle,\
	$HOURS using (0.8*cos(angle($1,12))):(0.8*sin(angle($1,12))):1 with labels font "Courier,24" notitle,\
	"" using (0.95*cos(angle($1,12))):(0.95*sin(angle($1,12))) with points pt 6 lc rgbcolor "black" ps 1 notitle,\
	$MINUTES using (0.95*cos(angle($1,60))):(0.95*sin(angle($1,60))) with points pt 6 ps 0.5 lc rgbcolor "black" notitle,\
	$TIME using (0):(0):(0.6*cos(hours($1,$2,$3))):(0.6*sin(hours($1,$2,$3))) with vectors nohead lc rgbcolor "black" lw 3 notitle,\
	"" using (0):(0):(0.9*cos(minutes($1,$2,$3))):(0.9*sin(minutes($1,$2,$3))) with vectors nohead lc rgbcolor "black" lw 2 notitle,\
	"" using (0):(0):(0.99*cos(seconds($1,$2,$3))):(0.99*sin(seconds($1,$2,$3))) with vectors nohead lc rgbcolor "black" lw 1 notitle,\
	"" using (0):(0):(0.2*cos(pi+seconds($1,$2,$3))):(0.2*sin(pi+seconds($1,$2,$3))) with vectors nohead lc rgbcolor "black" lw 1 notitle