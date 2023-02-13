# Generate an SVG file with gnuplot
set terminal svg dynamic enhanced font "Courier,8" linewidth 1 background "white"

# Data is tab-delimited
set datafile sep '\t'

# The output file is zwiftLevelsCyclic.svg
set output "zwiftLevelsCyclic.svg"

# Account for a radius allowing a circumference of 750,000 (XP)
#set xrange [-3024:3024]
#set yrange [-3024:3024]
set xrange [-119367:119367]
set yrange [-119367:119367]
unset border
set size square

unset xtics
unset ytics
unset key

# The specific number of XP earned
$XP << EOD
676830
EOD

# Levels in number, min XP, max XP order
$LEVELS << EOD
0	-1	0
1	0	1000
2	1000	2000
3	2000	3000
4	3000	4000
5	4000	5000
6	5000	7000
7	7000	10000
8	10000	13000
9	13000	16000
10	16000	19000
11	19000	23000
12	23000	28000
13	28000	33000
14	33000	38000
15	38000	44000
16	44000	50000
17	50000	56000
18	56000	62000
19	62000	70000
20	70000	78000
21	78000	88000
22	88000	94000
23	94000	100000
24	100000	110000
25	110000	121000
26	121000	130000
27	130000	140000
28	140000	150000
29	150000	170000
30	170000	180000
31	180000	190000
32	190000	200000
33	200000	220000
34	220000	230000
35	230000	250000
36	250000	260000
37	260000	280000
38	280000	290000
39	290000	310000
40	310000	330000
41	330000	340000
42	340000	360000
43	360000	380000
44	380000	400000
45	400000	420000
46	420000	440000
47	440000	460000
48	460000	480000
49	480000	500000
50	500000	520000
51	520000	540000
52	540000	560000
53	560000	580000
54	580000	600000
55	600000	630000
56	630000	660000
57	660000	690000
58	690000	720000
59	720000	750000
60	750000	750001
EOD

# Calculate the level based on XP earned
level(xp) = ( xp < 1000 )?( 1 ):(( xp < 2000 )?( 2 ):(( xp < 3000 )?( 3 ):(( xp < 4000 )?( 4 ):(( xp < 5000 )?( 5 ):(( xp < 7000 )?( 6 ):(( xp < 10000 )?( 7 ):(( xp < 13000 )?( 8 ):(( xp < 16000 )?( 9 ):(( xp < 19000 )?( 10 ):(( xp < 23000 )?( 11 ):(( xp < 28000 )?( 12 ):(( xp < 33000 )?( 13 ):(( xp < 38000 )?( 14 ):(( xp < 44000 )?( 15 ):(( xp < 50000 )?( 16 ):(( xp < 56000 )?( 17 ):(( xp < 62000 )?( 18 ):(( xp < 70000 )?( 19 ):(( xp < 78000 )?( 20 ):(( xp < 88000 )?( 21 ):(( xp < 94000 )?( 22 ):(( xp < 100000 )?( 23 ):(( xp < 110000 )?( 24 ):(( xp < 121000 )?( 25 ):(( xp < 130000 )?( 26 ):(( xp < 140000 )?( 27 ):(( xp < 150000 )?( 28 ):(( xp < 170000 )?( 29 ):(( xp < 180000 )?( 30 ):(( xp < 190000 )?( 31 ):(( xp < 200000 )?( 32 ):(( xp < 220000 )?( 33 ):(( xp < 230000 )?( 34 ):(( xp < 250000 )?( 35 ):(( xp < 260000 )?( 36 ):(( xp < 280000 )?( 37 ):(( xp < 290000 )?( 38 ):(( xp < 310000 )?( 39 ):(( xp < 330000 )?( 40 ):(( xp < 340000 )?( 41 ):(( xp < 360000 )?( 42 ):(( xp < 380000 )?( 43 ):(( xp < 400000 )?( 44 ):(( xp < 420000 )?( 45 ):(( xp < 440000 )?( 46 ):(( xp < 460000 )?( 47 ):(( xp < 480000 )?( 48 ):(( xp < 500000 )?( 49 ):(( xp < 520000 )?( 50 ):(( xp < 540000 )?( 51 ):(( xp < 560000 )?( 52 ):(( xp < 580000 )?( 53 ):(( xp < 600000 )?( 54 ):(( xp < 630000 )?( 55 ):(( xp < 660000 )?( 56 ):(( xp < 690000 )?( 57 ):(( xp < 720000 )?( 58 ):(( xp < 750000 )?( 59 ):( 60 )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

# Calculate minimum/maximum XP earned based on level
minXP(level) = ( level < 2 )?( 0 ):(( level < 3 )?( 1000 ):(( level < 4 )?( 2000 ):(( level < 5 )?( 3000 ):(( level < 6 )?( 4000 ):(( level < 7 )?( 5000 ):(( level < 8 )?( 7000 ):(( level < 9 )?( 10000 ):(( level < 10 )?( 13000 ):(( level < 11 )?( 16000 ):(( level < 12 )?( 19000 ):(( level < 13 )?( 23000 ):(( level < 14 )?( 28000 ):(( level < 15 )?( 33000 ):(( level < 16 )?( 38000 ):(( level < 17 )?( 44000 ):(( level < 18 )?( 50000 ):(( level < 19 )?( 56000 ):(( level < 20 )?( 62000 ):(( level < 21 )?( 70000 ):(( level < 22 )?( 78000 ):(( level < 23 )?( 88000 ):(( level < 24 )?( 94000 ):(( level < 25 )?( 100000 ):(( level < 26 )?( 110000 ):(( level < 27 )?( 121000 ):(( level < 28 )?( 130000 ):(( level < 29 )?( 140000 ):(( level < 30 )?( 150000 ):(( level < 31 )?( 170000 ):(( level < 32 )?( 180000 ):(( level < 33 )?( 190000 ):(( level < 34 )?( 200000 ):(( level < 35 )?( 220000 ):(( level < 36 )?( 230000 ):(( level < 37 )?( 250000 ):(( level < 38 )?( 260000 ):(( level < 39 )?( 280000 ):(( level < 40 )?( 290000 ):(( level < 41 )?( 310000 ):(( level < 42 )?( 330000 ):(( level < 43 )?( 340000 ):(( level < 44 )?( 360000 ):(( level < 45 )?( 380000 ):(( level < 46 )?( 400000 ):(( level < 47 )?( 420000 ):(( level < 48 )?( 440000 ):(( level < 49 )?( 460000 ):(( level < 50 )?( 480000 ):(( level < 51 )?( 500000 ):(( level < 52 )?( 520000 ):(( level < 53 )?( 540000 ):(( level < 54 )?( 560000 ):(( level < 55 )?( 580000 ):(( level < 56 )?( 600000 ):(( level < 57 )?( 630000 ):(( level < 58 )?( 660000 ):(( level < 59 )?( 690000 ):(( level < 60 )?( 720000 ):( 750000 )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
maxXP(level) = ( level < 2 )?( 1000 ):(( level < 3 )?( 2000 ):(( level < 4 )?( 3000 ):(( level < 5 )?( 4000 ):(( level < 6 )?( 5000 ):(( level < 7 )?( 7000 ):(( level < 8 )?( 10000 ):(( level < 9 )?( 13000 ):(( level < 10 )?( 16000 ):(( level < 11 )?( 19000 ):(( level < 12 )?( 23000 ):(( level < 13 )?( 28000 ):(( level < 14 )?( 33000 ):(( level < 15 )?( 38000 ):(( level < 16 )?( 44000 ):(( level < 17 )?( 50000 ):(( level < 18 )?( 56000 ):(( level < 19 )?( 62000 ):(( level < 20 )?( 70000 ):(( level < 21 )?( 78000 ):(( level < 22 )?( 88000 ):(( level < 23 )?( 94000 ):(( level < 24 )?( 100000 ):(( level < 25 )?( 110000 ):(( level < 26 )?( 121000 ):(( level < 27 )?( 130000 ):(( level < 28 )?( 140000 ):(( level < 29 )?( 150000 ):(( level < 30 )?( 170000 ):(( level < 31 )?( 180000 ):(( level < 32 )?( 190000 ):(( level < 33 )?( 200000 ):(( level < 34 )?( 220000 ):(( level < 35 )?( 230000 ):(( level < 36 )?( 250000 ):(( level < 37 )?( 260000 ):(( level < 38 )?( 280000 ):(( level < 39 )?( 290000 ):(( level < 40 )?( 310000 ):(( level < 41 )?( 330000 ):(( level < 42 )?( 340000 ):(( level < 43 )?( 360000 ):(( level < 44 )?( 380000 ):(( level < 45 )?( 400000 ):(( level < 46 )?( 420000 ):(( level < 47 )?( 440000 ):(( level < 48 )?( 460000 ):(( level < 49 )?( 480000 ):(( level < 50 )?( 500000 ):(( level < 51 )?( 520000 ):(( level < 52 )?( 540000 ):(( level < 53 )?( 560000 ):(( level < 54 )?( 580000 ):(( level < 55 )?( 600000 ):(( level < 56 )?( 630000 ):(( level < 57 )?( 660000 ):(( level < 58 )?( 690000 ):(( level < 59 )?( 720000 ):(( level < 60 )?( 750000 ):( 750001 )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

mymod( v , m ) = ( v > m )?( v - m ):( v )
angle( v ) = mymod( 5.0 * pi / 2.0 - v * 2.0 * pi , 2.0 * pi )
radius( xp ) = (maxXP( level( xp ) ) / ( 2.0 * pi ))
theta( xp ) = ( xp - minXP( level( xp ) ) ) / ( maxXP( level( xp ) ) - minXP( level( xp ) ) )
xCoord( xp ) = radius( xp ) * cos( angle( theta( xp ) ) )
yCoord( xp ) = radius( xp ) * sin( angle( theta( xp ) ) )

# print v if m divides v, empty string otherwise
even( v , m ) = ( v * 1.0 / m == int( v * 1.0 / m ) )?( sprintf( "% 2d" , v ) ):( "" )

# arcs have to be plotted in a counterclockwise direction with 0 being due east
plot $XP using (0):(0):(minXP(level($1))/(2.0*pi)) with circles lc rgbcolor "black" fs solid noborder title "Progress",\
	"" using (0):(0):(minXP(level($1)+1)/(2.0*pi)):(mymod(-270-theta($1)*360,360)):(90) with circles lc rgbcolor "black" fs solid noborder title "Progress",\
	$LEVELS using (0):(0):(($3/(2.0*pi))) with circles lc rgbcolor "gray" lw 0.5 title "Levels",\
	"" using (0):(($2/(2.0*pi))):(even( $1 , 10 )) with labels offset 0,0.1 font "Courier Bold,12" tc rgbcolor "gray" title "Milestones",\
	$XP using (0):(0):(sprintf( "Level % 2.0f\n%dXP\n%7.4f%%\nT-%05.0fXP" , level( $1 ) , $1 , theta( $1 ) * 100.0 , minXP( level( $1 ) + 1 ) - $1	)) with labels tc rgbcolor "white" font "Courier Bold,18" offset 0,-1 title "Status",\