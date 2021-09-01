g = -9.80 ; % gravitational acceleration
initial_velocity = 100 ;
initial_angle = 60 ;
Vox = initial_velocity * cosd(initial_angle) ;
Voy = initial_velocity * sind(initial_angle) ;
time_to_top = -Voy/g  %given by rearranging v = at

max_height = 0.5*g*time_to_top^2 + Voy*time_to_top  %maximum height reached given by 0.5at^2 + vt

height = [0 150 300 400] ; %when we solve for time at y = 400, we will get a complex value as the parabola does not intersect this height (no real solutions at this y-value)
A = g / 2 ; %represents coefficient of time_to_top^2 of quadratic in standard form
B = Voy ; %represents coefficient of time_to_top of quadratic in standard form
C = -height ; %represents constant term of quadratic in standard form
time_1 = (-B+sqrt(B^2-4*A*C))/(2*A)  %positive root

%last value complex because there is no real value for x at the given y-value (negative root when calculating B^2 - 4*A*C
time_2 = (-B-sqrt(B^2-4*A*C))/(2*A)  %negative root

time_1(1:3) 

rtime_1 = time_1(1:3) ;
rtime_2 = time_2(1:3) ; %remove complex parts/answers from the time values
x2_minus_x1 = (rtime_2 - rtime_1) * Vox 

time = [rtime_1 rtime_2] 

time .* time 

y = 0.5*g*time.*time + Voy*time  

% this ^ is a vectorized calculation of all the y-values by using the matrix multiplication to square each time in place
x = Vox*time 

figure(1)
plot(x,y,'o')
xlabel('Distance(m)'); ylabel('Height(m)') %Label the axes

N=0:100;
max_time = max(time)  %find the maximum value in the time array and store as a variable
TIME = N*max_time/100 ; 
XX = TIME * Vox ; %distance = speed * time (classic)
YY = 0.5*g*TIME.^2 + Voy*TIME ; 

figure(2)
plot(TIME,XX,TIME,YY) %plot both XX and YY on the same plot
xlabel('Time(s)'); ylabel('Height and Distance(m)') %label the x and y axes
figure(3) ; % new figure
plot(XX,YY,'-',x,y,'o') ;
xlabel('Distance(m)') ; ylabel('Height(m)')
title('Charles Daigle - Trajectory for V_o=100 m/s, angle=60°')