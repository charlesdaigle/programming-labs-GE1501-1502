r = [0 : 0.1 : 2] ;
theta = [0 : 10 : 360] ;

[r, theta] = meshgrid(r, theta) 

x = r.*cosd(theta) ;
y = r.*sind(theta) ;