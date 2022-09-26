set terminal svg dynamic font "Courier,12" linewidth 1 background "white" size 530,1200
set datafile sep '\t'
set output "drivetrain.svg"

# number of teeth on front and rear gears
front = 42
rear = 16

# dummy value
$VALUE << EOD
1
EOD

# for plotting each tooth
$FRONT << EOD
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
EOD

$REAR << EOD
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
EOD

set size square
set xrange [-4:4]
set yrange [-4:4]
unset xtics
unset ytics
unset border
unset key

set style fill solid noborder

# calculate size of each gap on the front and total size on the rear
frontSize = 2.0*pi/(front*2)
rearSize = frontSize * 2.0 * rear / ( 2.0 * pi )

# calculate perpendiculars to tangents
perpF = - 1.0 / ( ( 1 - ( 1 - rearSize ) ) / -4 )
perpR = - 1.0 / ( ( ( 1 - rearSize ) - 1 ) / 4 )

angF = atan( perpF )
angR = atan( perpR )

xF = 2 + cos( angF )
yF = -sin( angF )
xR = -2 + rearSize*cos( angR )
yR = -sin( angR )*rearSize + ( 1 - rearSize )

angleF = atan2( yF , xF - 2 )
angleR = atan2( yR - ( 1 - rearSize ) , xR + 2 )

set parametric
set trange [0:2*pi]

angle( v , n ) = mymod( 5.0 * pi / 2.0 - ( v - 1 ) / n * 2.0 * pi , 2.0 * pi )

# functions for getting values into correct range
mymod( v , m ) = ( v > m )?( v - m ):( v )
mynegmod( v , m ) = ( v < 0 )?( v + m ):( v )

coordX( v , n ) = cos( angle( v , n ) )
coordY( v , n ) = sin( angle( v , n ) )

# function for plotting chain on each gear
chainX( start , end , t ) = ( t >= start )?( ( t <= end )?( cos( t ) ):( 1 / 0 ) ):( 1 / 0 )
chainY( start , end , t ) = ( t >= start )?( ( t <= end )?( sin( t ) ):( 1 / 0 ) ):( 1 / 0 )

plot $VALUE using (2):(0):(1) with circles fc rgbcolor "black" notitle,\
	"" using (-2):(1-rearSize):(rearSize) with circles fc rgbcolor "black" notitle,\
	$FRONT using (coordX( $1 , front )+2):(coordY( $1 , front )):(frontSize) with circles fc rgbcolor "white" notitle,\
	$REAR using (rearSize*coordX( $1 , rear )-2):(1-rearSize + rearSize*coordY( $1 , rear )):(frontSize) with circles fc rgbcolor "white" notitle,\
	"" using (-2):(1):(4):(0) with vectors nohead lc rgbcolor "black" lw 6 dt 4 notitle,\
	"" using (xR):(yR):(xF-xR):(yF-yR) with vectors nohead lc rgbcolor "black" lw 6 dt 4 notitle,\
	(rearSize*chainX( pi / 2 , mynegmod( angleR , 2.0 * pi ) , t ) - 2),(1-rearSize+rearSize*chainY( pi / 2 , mynegmod( angleR , 2.0 * pi ) , t )) with lines lc rgbcolor "black" lw 6 dt 4 notitle,\
	(-chainX( pi / 2 , mynegmod( angleF , 2.0 * pi ) , t )+2),(chainY( pi / 2 , mynegmod( angleF , 2.0 * pi ) , t )) with lines lc rgbcolor "black" lw 6 dt 4 notitle