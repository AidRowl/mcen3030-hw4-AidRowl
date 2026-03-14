

clear; clc;

c = 4.3e-10;
Tship = 290;
Tinitial = 500;
Tfinal = 300;
N = 100;

F_vals = 0:0.05:1.0;      % 21 values
t_cool = zeros(size(F_vals));

for i = 1:numel(F_vals)
    F = F_vals(i);

    % Integrand for time (positive when integrating from Tfinal to Tinitial)
    integrand = @(T) 1 ./ ( c*(T.^4 - F*Tship^4) );

  
    t_cool(i) = trapezoider(integrand, Tfinal, Tinitial, N);
end

