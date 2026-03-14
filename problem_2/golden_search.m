function [x_max, f_max, eb] = golden_search(f, x_L, x_U, iter)
%GOLDEN_SEARCH Maximize a 1D function on [x_L, x_U] using Golden Section Search
% Inputs:
%   f    - function handle of one variable
%   x_L  - lower bound
%   x_U  - upper bound
%   iter - number of iterations
% Outputs:
%   x_max - estimated maximizer location
%   f_max - maximum value estimate f(x_max)
%   eb    - error bound such that max is in x_max ± eb

    % Golden ratio constants
    phi = (1 + sqrt(5))/2;
    r = 1/phi;  % ~0.618
    
    % Initialize interior points
    x1 = x_U - r*(x_U - x_L);
    x2 = x_L + r*(x_U - x_L);
    f1 = f(x1);
    f2 = f(x2);

    for k = 1:iter
        % For maximization: keep the side with the larger f-value
        if f1 < f2
            % Move left bound up
            x_L = x1;
            x1 = x2;  f1 = f2;
            x2 = x_L + r*(x_U - x_L);
            f2 = f(x2);
        else
            % Move right bound down
            x_U = x2;
            x2 = x1;  f2 = f1;
            x1 = x_U - r*(x_U - x_L);
            f1 = f(x1);
        end
    end

    x_max = (x_L + x_U)/2;
    f_max = f(x_max);
    eb = (x_U - x_L)/2;
end