function [y] = newton(c,x,r)
% Obliczanie wartości wielomianu w postaci Newtona w zadanych punktach
% za pomocą uogólnionego schematu Hornera
% Wejście:
% c - wektor współczynników wielomianu
% x - wektor węzłów interpolacji
% r - wektor argumentów
% Wyjście:
% y - wektor wyników

n = length(c); 
y = ones(size(r));

% Uogólniony schemat Hornera
y = y.*c(n);
for j = n-1:-1:1
    y = y.*(r - x(j)) + c(j);
end