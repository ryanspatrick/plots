set terminal svg dynamic font "Courier,8" linewidth 1 background "white"
set datafile sep '\t'
set output "dropsGame.svg"

set key top left inside Left

set y2label "Drops Earned"
set ylabel "Drops Multiplier"
set xlabel "Time"

set timefmt "%M:%S"
set xdata time
set format x "%H:%M"
set xrange ["00:00":"99:59"]
set xtics 0,300,(99*60) rotate by -45
set format y "%.2fx"
set yrange [0:3]
set y2range [0:]
set mxtics 5	
set grid x
set ytics nomirror

mymod( t , c ) = t - ( floor( t / c ) * c )
cycles( t ) = int(t/(37*60))

newM( t ) = ( t < 5 * 60 )?( 1.0 ):( t < 10 * 60 )?( 1.2 ):( t < 15 * 60 )?( 1.4 ):( t < 20 * 60 )?( 1.6 ):( t < 25 * 60 )?( 1.8 ):( 2.0 )
newMC( t ) = ( t < 5 * 60 )?( 1.0 * t ):( t < 10 * 60 )?( 1.2 * ( t - 300 ) + 300 ):( t < 15 * 60 )?( 1.4 * ( t - 600 ) + 300 + 300 * 1.2 ):( t < 20 * 60 )?( 1.6 * ( t - 900 ) + 300 + 300 * 1.2 + 300 * 1.4 ):( t < 25 * 60 )?( 1.8 * ( t - 1200 ) + 300 + 1.2 * 300 + 1.4 * 300 + 1.6 * 300 ):( 2.0 * ( t - 1500 ) + 300 + 1.2 * 300 + 1.4 * 300 + 1.6 * 300 + 1.8 * 300 )
oldM( t ) = ( mymod( t , 37 * 60 ) < 5 * 60 )?( 1.0 ):( mymod( t , 37 * 60 ) < 10 * 60 )?( 1.2 ):( mymod( t , 37 * 60 ) < 15 * 60 )?( 1.4 ):( mymod( t , 37 * 60 ) < 20 * 60 )?( 1.6 ):( mymod( t , 37 * 60 ) < 25 * 60 )?( 1.8 ):( mymod( t , 37 * 60 ) < 30 * 60 )?( 2.0 ):( 2.5 )
oldMC( t ) = ( mymod( t , 37 * 60 ) < 5 * 60 )?( cycles( t ) * 3750 + 1.0 * mymod( t , 37 * 60 ) ):( mymod( t , 37 * 60 ) < 10 * 60 )?( 1.2 * ( mymod( t - 300 , 37 * 60 ) ) + cycles( t ) * 3750 + 300 ):( mymod( t , 37 * 60 ) < 15 * 60 )?( 1.4 * ( mymod( t - 600 , 37 * 60 ) ) + cycles( t ) * 3750 + 300 + 1.2 * 300 ):( mymod( t , 37 * 60 ) < 20 * 60 )?( 1.6 * ( mymod( t - 900 , 37 * 60 ) ) + cycles( t ) * 3750 + 300 + 1.2 * 300 + 1.4 * 300 ):( mymod( t , 37 * 60 ) < 25 * 60 )?( 1.8 * ( mymod( t - 1200 , 37 * 60 ) ) + cycles( t ) * 3750 + 300 + 1.2 * 300 + 1.4 * 300 + 1.6 * 300 ):( mymod( t , 37 * 60 ) < 30 * 60 )?( 2.0 * ( mymod( t - 1500 , 37 * 60 ) ) + cycles( t ) * 3750 + 300 + 1.2 * 300 + 1.4 * 300 + 1.6 * 300 + 1.8 * 300 ):( 2.5 * ( mymod( t - 1800 , 37 * 60 ) ) + cycles( t ) * 3750 + 300 + 1.2 * 300 + 1.4 * 300 + 1.6 * 300 + 1.8 * 300 + 2.0 * 300 )

plot newM( x ) with lines lc rgbcolor "black" dt 1 title "New Drops Multiplier",\
	newMC( x ) axes x1y2 with lines lc rgbcolor "black" dt 2 title "New Drops Earned",\
	oldM( x ) with lines lc rgbcolor "black" dt 3 title "Old Drops Multiplier",\
	oldMC( x ) axes x1y2 with lines lc rgbcolor "black" dt 4 title "Old Drops Earned"