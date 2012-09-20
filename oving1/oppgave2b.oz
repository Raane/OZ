declare
X Y
X = 'dette er magisk'
{Browse Y}
Y = X
/*
* The order of the lines doesn't matter as oz is lazy
* Y was given a value in one of the lines in the program and therefore will allways have that value
* In our case that value is X, which in the same way, also will have one value throughout the execution of the program.
*/