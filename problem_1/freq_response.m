% freq_response.m
% Problem 1(b): Maximize response function G(w; wn, zeta) for zeta = 0.1:0.1:1

clear; clc;

wn = 2.5;
zetas = 0.1:0.1:1.0;

W_max = zeros(size(zetas));
G_max = zeros(size(zetas));

for i = 1:numel(zetas)
    z = zetas(i);

    % Response function G(omega; wn, zeta)
    G = @(w) (wn^2) ./ ( (wn^2 - w.^2).^2 + 4*(z^2)*(wn^2)*(w.^2) );

    % Golden search over omega in [0, 5]
    [w_star, g_star, eb] = golden_search(G, 0, 5, 20);

    W_max(i) = w_star;
    G_max(i) = g_star;
end

% (Optional) quick plot for sanity check
% figure; plot(zetas, W_max, 'o-'); xlabel('\zeta'); ylabel('\omega_{max}');
% figure; plot(zetas, G_max, 'o-'); xlabel('\zeta'); ylabel('G_{max}');