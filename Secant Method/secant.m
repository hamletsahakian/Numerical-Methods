function [zero, niter] = secant(f, x1, x2, tol, maxstep, varargin)
% Here we check if the parameters tol (tolerance of error) and
% maxstep (maximum iterations) are present. If not, we set them to the
% default of 0.01 and 5000 respectively
if (exist('tol'))
    tol;
else
    tol = 0.01;
end

if (exist('maxstep'))
    maxstep;
else
    maxstep = 5000;
end

% Here the starting points are defined
x(1) = x1;
x(2) = x2;

% Here we add titles and axis 
title('Secant Method');
xlabel('X-axis')
ylabel('Y-axis')

% Here we plot the function f from input
line(linspace(x1 - 1, x2 + 1), feval(f, linspace(x1 - 1, x2 + 1), varargin{:}));

% Here we plot the secant line
line([x(1), x(2)], [feval(f, x(1), varargin{:}), feval(f, x(2), varargin{:})], 'Color', 'r', 'LineStyle', '--' );

% Here we plot the f(x)= 0 line
line(xlim, [0 0], 'Color', 'black');

% Here we start looping using the Secant method formula, starting at i = 3 up to the defined amount of
% iterations maxstep
for i = 3:maxstep
    y(1) = feval(f,x(i-1),varargin{:});
    y(2)=  feval(f,x(i-2),varargin{:});
    % Here we calculate the new x(i) value untill we meet the required
    % tolerance 
    x(i) = (x(i-2)*(y(1)) - (x(i-1) * ( y(2) ) )) / (y(1) - y(2) );
    line([x(i - 1), x(i)], [y(1), feval(f, x(i), varargin{:})], 'Color', 'r', 'LineStyle', '--');
    if abs(x(i) - x(i - 1)) < tol
        niter = i - 2;
        zero = x(i);
        return
    end
end
return