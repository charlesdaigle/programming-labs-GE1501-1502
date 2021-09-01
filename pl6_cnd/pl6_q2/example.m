x = [-2 : 0.01 : 2] ;
y = [-2 : 0.01 : 2] ;
[X, Y] = meshgrid(x, y) ;
T = exp(-X.^2 - Y.^2) ;
mesh(X, Y, T) ;