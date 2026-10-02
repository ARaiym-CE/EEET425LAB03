%EEET 425 LAB03 Q2a
Tb = 20;
A = 1;
k = 1:Tb;

s0 = A * ones(Tb, 1); % makes a matrix full of ones 20x1
s1 = [A * ones(Tb/2, 1); -A * ones(Tb/2, 1)]; % makes a matrix full of ones first half then second half full of negative ones

variances = [0, 0.1, 0.01];

R_xs0 = zeros(Tb, 3);
R_xs1 = zeros(Tb, 3);

for v = 1:3
    var_w = variances(v);
    w = sqrt(var_w) * randn(Tb, 1);
    x = s0 + w;
    
    for i = 1:Tb
        R_xs0(i, v) = sum(x(1:i) .* s0(1:i)); % multiplies received signal with s0 up to index i and sums it
        R_xs1(i, v) = sum(x(1:i) .* s1(1:i)); % multiplies received signal with s1 up to index i and sums it
    end
end

figure;
stem(k, [R_xs0(:, 1), R_xs1(:, 1)], 'filled')

figure;
stem(k, [R_xs0(:, 2), R_xs1(:, 2)], 'filled')

figure;
stem(k, [R_xs0(:, 3), R_xs1(:, 3)], 'filled')