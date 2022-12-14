function [c] = wspolczynniki(x,y)
% Wyznaczanie wartości współczynników wielomianu interpolacyjnego
% w postaci Newtona wykorzystując schemat iorazów różnicowych
% Wejscie:
% x - wektor węzłów interpolacji
% y - wektor wartości
% Wyjscie:
% c - wektor współczynników wielomianu 

n = length(x); % ilość współczynników
A = zeros(n); 
A(:,1) = y; % Pierwszą kolumnę zapełniamy wektorem wartości

% Schemat ilorazów różnicowych
for j = 2:n 
    for i = j:n
        A(i,j) = (A(i,j-1) - A(i-1,j-1))/(x(i) - x(i-j+1));
    end
end

c = diag(A); % Współczynniki wielomianu leżą na diagonali

if size(c) ~= size(x)
    c = c'; % Zwracamy transpozycje 


end