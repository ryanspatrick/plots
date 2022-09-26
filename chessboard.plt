set terminal svg dynamic font "Courier,12" linewidth 1 background "white"
set datafile sep '\t'
set output "plot.svg"

unset key
unset border

# Data for generating the chessboard grid
$DATA << EOD
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	2	1
10	2	2
11	2	3
12	2	4
13	2	5
14	2	6
15	2	7
16	2	8
17	3	1
18	3	2
19	3	3
20	3	4
21	3	5
22	3	6
23	3	7
24	3	8
25	4	1
26	4	2
27	4	3
28	4	4
29	4	5
30	4	6
31	4	7
32	4	8
33	5	1
34	5	2
35	5	3
36	5	4
37	5	5
38	5	6
39	5	7
40	5	8
41	6	1
42	6	2
43	6	3
44	6	4
45	6	5
46	6	6
47	6	7
48	6	8
49	7	1
50	7	2
51	7	3
52	7	4
53	7	5
54	7	6
55	7	7
56	7	8
57	8	1
58	8	2
59	8	3
60	8	4
61	8	5
62	8	6
63	8	7
64	8	8
EOD

# Function for determining space colors
chessboard( r , c ) = ( ( r + c ) / 2.0 == int( ( r + c ) / 2.0 ))?( "white" ):( "gray" ) 

# The squares for the chessboard
set obj 1 rect from 0.5,0.5 to 1.5,1.5 fc rgbcolor "white"
set obj 2 rect from 0.5,1.5 to 1.5,2.5 fc rgbcolor "gray"
set obj 3 rect from 0.5,2.5 to 1.5,3.5 fc rgbcolor "white"
set obj 4 rect from 0.5,3.5 to 1.5,4.5 fc rgbcolor "gray"
set obj 5 rect from 0.5,4.5 to 1.5,5.5 fc rgbcolor "white"
set obj 6 rect from 0.5,5.5 to 1.5,6.5 fc rgbcolor "gray"
set obj 7 rect from 0.5,6.5 to 1.5,7.5 fc rgbcolor "white"
set obj 8 rect from 0.5,7.5 to 1.5,8.5 fc rgbcolor "gray"
set obj 9 rect from 1.5,0.5 to 2.5,1.5 fc rgbcolor "gray"
set obj 10 rect from 1.5,1.5 to 2.5,2.5 fc rgbcolor "white"
set obj 11 rect from 1.5,2.5 to 2.5,3.5 fc rgbcolor "gray"
set obj 12 rect from 1.5,3.5 to 2.5,4.5 fc rgbcolor "white"
set obj 13 rect from 1.5,4.5 to 2.5,5.5 fc rgbcolor "gray"
set obj 14 rect from 1.5,5.5 to 2.5,6.5 fc rgbcolor "white"
set obj 15 rect from 1.5,6.5 to 2.5,7.5 fc rgbcolor "gray"
set obj 16 rect from 1.5,7.5 to 2.5,8.5 fc rgbcolor "white"
set obj 17 rect from 2.5,0.5 to 3.5,1.5 fc rgbcolor "white"
set obj 18 rect from 2.5,1.5 to 3.5,2.5 fc rgbcolor "gray"
set obj 19 rect from 2.5,2.5 to 3.5,3.5 fc rgbcolor "white"
set obj 20 rect from 2.5,3.5 to 3.5,4.5 fc rgbcolor "gray"
set obj 21 rect from 2.5,4.5 to 3.5,5.5 fc rgbcolor "white"
set obj 22 rect from 2.5,5.5 to 3.5,6.5 fc rgbcolor "gray"
set obj 23 rect from 2.5,6.5 to 3.5,7.5 fc rgbcolor "white"
set obj 24 rect from 2.5,7.5 to 3.5,8.5 fc rgbcolor "gray"
set obj 25 rect from 3.5,0.5 to 4.5,1.5 fc rgbcolor "gray"
set obj 26 rect from 3.5,1.5 to 4.5,2.5 fc rgbcolor "white"
set obj 27 rect from 3.5,2.5 to 4.5,3.5 fc rgbcolor "gray"
set obj 28 rect from 3.5,3.5 to 4.5,4.5 fc rgbcolor "white"
set obj 29 rect from 3.5,4.5 to 4.5,5.5 fc rgbcolor "gray"
set obj 30 rect from 3.5,5.5 to 4.5,6.5 fc rgbcolor "white"
set obj 31 rect from 3.5,6.5 to 4.5,7.5 fc rgbcolor "gray"
set obj 32 rect from 3.5,7.5 to 4.5,8.5 fc rgbcolor "white"
set obj 33 rect from 4.5,0.5 to 5.5,1.5 fc rgbcolor "white"
set obj 34 rect from 4.5,1.5 to 5.5,2.5 fc rgbcolor "gray"
set obj 35 rect from 4.5,2.5 to 5.5,3.5 fc rgbcolor "white"
set obj 36 rect from 4.5,3.5 to 5.5,4.5 fc rgbcolor "gray"
set obj 37 rect from 4.5,4.5 to 5.5,5.5 fc rgbcolor "white"
set obj 38 rect from 4.5,5.5 to 5.5,6.5 fc rgbcolor "gray"
set obj 39 rect from 4.5,6.5 to 5.5,7.5 fc rgbcolor "white"
set obj 40 rect from 4.5,7.5 to 5.5,8.5 fc rgbcolor "gray"
set obj 41 rect from 5.5,0.5 to 6.5,1.5 fc rgbcolor "gray"
set obj 42 rect from 5.5,1.5 to 6.5,2.5 fc rgbcolor "white"
set obj 43 rect from 5.5,2.5 to 6.5,3.5 fc rgbcolor "gray"
set obj 44 rect from 5.5,3.5 to 6.5,4.5 fc rgbcolor "white"
set obj 45 rect from 5.5,4.5 to 6.5,5.5 fc rgbcolor "gray"
set obj 46 rect from 5.5,5.5 to 6.5,6.5 fc rgbcolor "white"
set obj 47 rect from 5.5,6.5 to 6.5,7.5 fc rgbcolor "gray"
set obj 48 rect from 5.5,7.5 to 6.5,8.5 fc rgbcolor "white"
set obj 49 rect from 6.5,0.5 to 7.5,1.5 fc rgbcolor "white"
set obj 50 rect from 6.5,1.5 to 7.5,2.5 fc rgbcolor "gray"
set obj 51 rect from 6.5,2.5 to 7.5,3.5 fc rgbcolor "white"
set obj 52 rect from 6.5,3.5 to 7.5,4.5 fc rgbcolor "gray"
set obj 53 rect from 6.5,4.5 to 7.5,5.5 fc rgbcolor "white"
set obj 54 rect from 6.5,5.5 to 7.5,6.5 fc rgbcolor "gray"
set obj 55 rect from 6.5,6.5 to 7.5,7.5 fc rgbcolor "white"
set obj 56 rect from 6.5,7.5 to 7.5,8.5 fc rgbcolor "gray"
set obj 57 rect from 7.5,0.5 to 8.5,1.5 fc rgbcolor "gray"
set obj 58 rect from 7.5,1.5 to 8.5,2.5 fc rgbcolor "white"
set obj 59 rect from 7.5,2.5 to 8.5,3.5 fc rgbcolor "gray"
set obj 60 rect from 7.5,3.5 to 8.5,4.5 fc rgbcolor "white"
set obj 61 rect from 7.5,4.5 to 8.5,5.5 fc rgbcolor "gray"
set obj 62 rect from 7.5,5.5 to 8.5,6.5 fc rgbcolor "white"
set obj 63 rect from 7.5,6.5 to 8.5,7.5 fc rgbcolor "gray"
set obj 64 rect from 7.5,7.5 to 8.5,8.5 fc rgbcolor "white"

# Setting the range so the tics line up correctly 
set xrange [0.5:8.5]
set yrange [0.5:8.5]
set y2range [0.5:8.5]
set size square

# Setting the exact tic marks
set xtics ("a" 1,"b" 2,"c" 3,"d" 4,"e" 5,"f" 6,"g" 7,"h" 8)
set ytics 1,1,8
set x2tics ("a" 1,"b" 2,"c" 3,"d" 4,"e" 5,"f" 6,"g" 7,"h" 8)
set y2tics 1,1,8

# Using the data to generate the text for creating the squares for the chessboard
#plot $DATA using (0):1:(sprintf( "set obj %.0f rect from %.1f,%.1f to %.1f,%.1f fc rgbcolor \"%s\"" , $1 , $2 - 0.5 , $3 - 0.5 , $2 + 0.5 , $3 + 0.5 , chessboard( $2 , $3 ) ) ) with labels notitle

# An example plot
plot $DATA using (1):(1) axes x1y2 with points pt 7 lc rgbcolor "red" notitle