function [] = LogisticMap(lambdaMin, lambdaMax, N)

% Here we check if the parameter N is present, if not we set it to the
% default 400
if (exist('N'))
    N;
else
    N = 1000;
end

% Here we check if the input is valid
if (lambdaMin <= lambdaMax && lambdaMin >= 0 && lambdaMax <= 4)
    lambdaMin;
    lambdaMax;
else
    error('Error occurred. The restriction is 0<=lambdaMin<=lambdaMax<=4.');
    return
end

% Here we create the interval with N-steps
Values_between = linspace(lambdaMin, lambdaMax, N);

% Here we create the zero vector called x, with the length of the x vector
% being the Values_between vector representing the rows, and defined n as
% columns. We picked n = 500 by trial and error.
n = 600;
x = zeros(length(Values_between), n);

% Here we set the initial value x_0 on every row of the vector x, next we
% apply the formula for every column, based on the previous column
for i = 1:length(Values_between)
    x(i,1) = .5;
    for j = 1:n-1
        x(i,j+1) = Values_between(i) * x(i,j) * (1 - x(i,j));
    end
end

% Here we only pick the upper 40% of the last n, since we want the values
% of x_n for large n
x = x(:,(n*.80:n));

% Here we plot the lambdas to x
plot(Values_between, x, 'color', 'black');

% Here we add titles and axis
title('Logistic map');
xlabel('Values of Lambda');  ylabel('Values of X');

return