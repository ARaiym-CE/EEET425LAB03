%EEET 425 LAB03 Q1 1)

N = 1000;
w = -1 + 2 * rand(N, 1);
a = [1 -0.95];
b = [1];

y = filter(b, a, w);

%stem(w, y, 'filled')

ylength = length(y);
m = -150:150;
mlength = length(m);
ryy = zeros(mlength, 1);
rww = zeros(mlength, 1);
ryw = zeros(mlength, 1);

for i = 1:mlength
    lag = m(i);
    if lag >= 0
        ryy(i) = sum(y(1+lag:N) .* y(1:N-lag)); %multiplies the signal by a delayed version of itself and sums the result
    else
        ryy(i) = sum(y(1:N+lag) .* y(1-lag:N)); %calculates autocorrelation for negative lags by shifting the signal in reverse
    end
end
    
for i = 1:mlength
    lag = m(i);
    if lag >= 0
        rww(i) = sum(w(1+lag:N) .* w(1:N-lag));
    else
        rww(i) = sum(w(1:N+lag) .* w(1-lag:N));
    end
end

for i = 1:mlength
    lag = m(i);
    if lag >= 0
        ryw(i) = sum(y(1+lag:N) .* w(1:N-lag));
    else
        ryw(i) = sum(y(1:N+lag) .* w(1-lag:N));
    end
end

%stem(m, ryy, 'filled')
%stem(m, rww, 'filled')
stem(m, ryw, 'filled')