%EEET 425 LAB03 Q1 1)

N = 1000;
w = -1 + 2 * rand(N, 1);
a = [1 -0.95];
b = [1];

y = filter(b, a, w);

stem(w, y, 'filled')
