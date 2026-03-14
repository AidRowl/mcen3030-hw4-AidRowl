function A = trapezoider(f, x_L, x_U, N)
%TRAPEZOIDER Area under f from x_L to x_U using N trapezoids
% N trapezoids => N+1 points

    h = (x_U - x_L)/N;
    x = x_L:h:x_U;        % length N+1
    y = f(x);

    % Trapezoid rule:
    A = h * (0.5*y(1) + sum(y(2:end-1)) + 0.5*y(end));
end