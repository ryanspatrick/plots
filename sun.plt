set terminal svg dynamic font "Courier,12" linewidth 1 background "white"
set datafile sep '\t'
set output "sun.svg"

# set up axes and data format
set  key top center horizontal outside
set timefmt "%Y-%m-%d %H:%M"
set xdata time
set format x "%B"
set xrange ["2022-12-21 21:48":"2023-12-22 03:28"]
set x2range [-2.0:2.0]
set border 1
set yrange [-2.0:2.0]
set size square
unset ytics
set xtics nomirror rotate by -45
unset mxtics

mymod( v , m ) = ( v > m )?( v - m ):( v )
negmod( v , m ) = ( v < 0 )?( v + m ):( v )

set parametric
set trange [0:1]

$DATA << EOD
"2023-05-01 00:00"
EOD

# Sun's Rays
$SUN << EOD
1
2
3
4
5
EOD

set style arrow 1 filled size 1,20 lc rgbcolor "black" fixed

# Solstice dates/times
start = strptime( "%Y-%m-%d %H:%M" , "2022-12-21 21:48" )
end = strptime( "%Y-%m-%d %H:%M" , "2023-12-22 03:28" )

# Calculate where date falls between solstices
fraction( time ) = ( ( strptime( "%Y-%m-%d %H:%M" , time ) - start ) / ( end - start ) )

# Calculate tilt of Earth (between 23.5 and -23.5 degrees from horizontal)
tilt( time ) = ( fraction( time ) < 0.5 )?( -94.0 * fraction( time ) + 23.5 ):( 94 * fraction( time ) - 70.5 )

plot $DATA using (strptime( "%Y-%m-%d %H:%M" , stringcolumn(1))):(-2) with points lc rgbcolor "black" pt 12 ps 1.25 title "Current Date",\
	"" using (0):(0):(1):(90):(270) axes x2y1 with circles fs solid fc rgbcolor "gray" title "Night",\
	"" using (-1.5):(-1.75):(sprintf( "%s" , strftime( "%B %d" , strptime( "%Y-%m-%d %H:%M:%S" , stringcolumn( 1 ) ) ) ) )  axes x2y1 with labels left font "Courier,24" notitle,\
	"" using (0):(0):(1):(tilt(stringcolumn(1))):(tilt(stringcolumn(1))+180.0) axes x2y1 with circles lc rgbcolor "black" notitle,\
	"" using (0):(0):(1) axes x2y1 with circles lc rgbcolor "black" title "Earth",\
	"" using (0):(0):(0.5*cos(negmod(tilt(stringcolumn(1)),360)*pi/180.0)):(0.5*sin(negmod(tilt(stringcolumn(1)),360)*pi/180.0)) axes x2y1 with vectors as 1 title "Earth's Rotation",\
	$SUN using (1.5):(($1-1)/4.0*2.0-1.0):(-0.25):(0) axes x2y1 with vectors lc rgbcolor "black" title "Sun's Rays",\
	"" using (-1):(1):(0.1) axes x2y1 with circles lc rgbcolor "black" dt 2 title "Earth's Orbit",\
	"" using (-1):(1):(0.05) axes x2y1 with circles lc rgbcolor "black" fs pattern 2 title "Sun",\
	"" using (-1):(1.05) with points pt 7 lc rgbcolor "black" notitle,\
	$DATA using (-1+0.1*cos(mymod(fraction(stringcolumn(1))*2.0*pi+pi/2.0,2.0*pi))):(1+0.1*sin(mymod(fraction(stringcolumn(1))*2.0*pi+pi/2.0,2.0*pi))):(0.015) axes x2y1 with circles lc rgbcolor "black" notitle