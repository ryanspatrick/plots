set terminal svg dynamic font "Courier,12" linewidth 1 background "white"
set datafile sep '\t'
set output "cycle.svg"

unset key
unset xtics
unset ytics
unset border

# Cycle will be radius 1 with circular nodes
set xrange [-1.25:1.25]
set yrange [-1.25:1.25]
set size square

# Number of nodes
# Radius of each node
# Translation of arrows to edge of nodes
# Size of arrows
n = 6
r = 0.1
offset = 0.015
scale = 0.01

# The nodes
$DATA << EOD
1
2
3
4
5
6
EOD

# Functions for calculating position of nodes, starting with due north and moving clockwise
mymod( v , m ) = ( v > m )?( v - m ):( v )
angle( v ) = mymod( 5.0 * pi / 2.0 - ( v - 1 ) / n * 2.0 * pi , 2.0 * pi )
xCoord( v ) = cos( angle( v ) )
yCoord( v ) = sin( angle( v ) )
xEdge( v , t ) = -cos( angle( 0 ) + ( v - 1 ) * 2.0 * pi / n + t )
yEdge( v , t ) = sin( angle( 0 ) + ( v - 1 ) * 2.0 * pi / n + t )

# Using parametric coordinates to draw the edges between nodes
set parametric
set trange [r:(2.0*pi/n-1.0*r)]

# Use filled, black arrows with 40-degree tip
set style arrow 1 size 0.1,20 lc rgbcolor "black" fixed

# Plot labels for nodes (as letters), circles for nodes, edges between nodes, and arrows
plot $DATA using (xCoord($1)):(yCoord($1)):(sprintf( "%c" , $1 + 64 )) with labels font "Courier,24" notitle,\
	"" using (xCoord($1)):(yCoord($1)):(r) with circles lc rgbcolor "black" notitle,\
	for [i=1:n] xEdge(i,t),yEdge(i,t) with lines lc rgbcolor "black" notitle,\
	$DATA using (xEdge($1,2.0*pi/n-r-offset)):(yEdge($1,2.0*pi/n-r-offset)):(sin(angle($1+1)+2.0*pi/n*r)*scale):(-cos(angle($1+1)+2.0*pi/n*r)*scale) with vectors as 1 notitle