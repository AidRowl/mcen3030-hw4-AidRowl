function [x_max, f_max] = steepest_ascent(f, grad_f, seed, step, con_accept, max_iter)

    x_old = seed(:); % ensure column
    f_old = f(x_old);

    for k = 1:max_iter
        g = grad_f(x_old);

        % If gradient is tiny, stop
        if norm(g) < 1e-12
            break;
        end

        % Direction of ascent
        d = g / norm(g);

        phi = @(a) f(x_old + a*d);
        [a_star, ~, ~] = golden_search(phi, 0, step, 20);

        x_new = x_old + a_star*d;
        f_new = f(x_new);

        con = sum(abs(x_new - x_old));

        x_old = x_new;
        f_old = f_new;

        if con < con_accept
            break;
        end
    end

    x_max = x_old;
    f_max = f_old;
end