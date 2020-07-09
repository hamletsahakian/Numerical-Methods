%% Question 3-Plot
[x, y] = meshgrid(-(2*pi):0.3:(2*pi), -pi:0.3:pi);
dx = y; 
dy =-y/2-sin(x);
dxu = dx./sqrt(dx.^2+dy.^2);
dyu = dy./sqrt(dx.^2+dy.^2);
quiver(x,y,dxu, dyu)
title('Phase portrait using Runge-Kutta 4th order method')