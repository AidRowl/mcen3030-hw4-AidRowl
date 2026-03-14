% SA_driver.m  (Problem 2b)
% Uses steepest ascent to maximize the best-fit function y(x1,x2,x3)

clear; clc;

% ---- Coefficients provided in assignment/starter snippet ----
b11 = -1.0;
b22 = -1.2;
b33 = -1.3;
b13 =  0.4;
a1  =  0.611;
a2  =  1.791;
a3  =  0.722;
a0  =  2.4;

% y(x) where x = [x1; x2; x3]
y = @(x) ( ...
      a0 ...
    + a1*x(1)      + a2*x(2)      + a3*x(3) ...
    + b11*x(1).^2  + b22*x(2).^2  + b33*x(3).^2 ...
    + b13*x(1).*x(3) ...
);

% Gradient grad_y(x) = [dy/dx1; dy/dx2; dy/dx3]
grad_y = @(x) [ ...
    a1 + 2*b11*x(1) + b13*x(3); ...
    a2 + 2*b22*x(2); ...
    a3 + 2*b33*x(3) + b13*x(1) ...
];

% Required settings
seed = [0.5; 0.5; 0.5];
con_accept = 0.001;
max_iter = 100;

% "step" is the maximum line-search distance (alpha in [0, step])
step = 1.0;

% Run steepest ascent
[x_max, y_max] = steepest_ascent(y, grad_y, seed, step, con_accept, max_iter);

% Ensure outputs are named exactly as required
x_max = x_max(:).';  % make row array for display (still an array)
y_max = y_max;       % scalar

disp("x_max = "); disp(x_max);
disp("y_max = "); disp(y_max);