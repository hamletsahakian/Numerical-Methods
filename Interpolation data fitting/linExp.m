function [] = linExp(data, guessed_lambdas)
%{
Our Matlab-function fits a linear combination of exponential functions 
to the given data. The idea is that the function linExp(data, guessed_lambdas) 
is going to fit a line on the data given by creating what was described in 
the sentence before. The function itself is found by using initial guessed 
values for lambda(s) (vector) and from here to find optimal values close to 
our input. This will result in a graph (that we have found) plotted 
together with the scatterplot of all the datapoints. We will also print the 
values of the lambdas, constants and residue that have been found by our 
function.
%}

% Here we split up the data into 2 columns since the data comes in the
% format of a m x 2 matrix
column1 = data(:, 1);
column2 = data(:, 2);

% The least sqaured function should be on ||AC-column2|| in order to
% minimise residue with A = matrix of exponentials and C = A/Column2.
least_squares_f = @(lambda_values) norm(exp(column1*lambda_values) * (exp(column1*lambda_values)\column2) - column2);

% With our guessed lambdas from the input, we here find optimal lambdas
% using the finction fminsearch() with a minimum residue
optimal_lambdas = fminsearch(least_squares_f, guessed_lambdas);

% With our optimal found lambdas we can calculate A, C and the residue as 
% seen below.
A       = exp(column1*optimal_lambdas);
C       = A\column2;
residue = norm(A*C-column2);

% The fitted line that we have to generate contains the x-values of the
% input data (first column) and the y values A*C which is described above.
x_column_1 = column1;
y_column_2 = A*C;

% Here we print out the optimum constants, lambdas and residue that's has
% been calculated by guessing different values of lambda
disp(['Optimal Lambdas   : ' num2str(optimal_lambdas)]);
disp(['Optimal Constants : ' num2str(C')]);
disp(['Residue           : ' num2str(residue)]);

% Here we plot the data points in magenta color together with the function Ex3 plotted
hold on;

title('Function Ex3 that fits a linear combination of exponential functions to the datapoints.');
scatter(column1, column2, 8, 'm','filled');
plot(x_column_1, y_column_2,'k','LineWidth', 3);
xlabel('X-axis')
ylabel('Y-axis')
legend('data points', 'f(x)');

hold off

return