function [x] = BlockCrout(A,b)
% Funkcja rozwiązuje układ liniowy metodą blokową Crouta
% Parametry wejścia:
% A, b - macierz R^(nxn) i wektor układu R^n
% Macierz A jest postaci [A11, A12; -I, A22]
% Parametr wyjścia:
% x - wektor rozwiązania R^n

n = length(A(1,:));
p = n/2;

if length(A(:,1)) ~= n
    error('Macierz A musi być kwadratowa');
    return;
end

if length(b)~=n
    error('Nieodpowiedni rozmiar wektora b');
    return;
end

if det(A) == 0
    error('Macierz jest osobliwa');
    return;
end

%Wybór podmacierzy
A11 = A(1:(p),1:(p));
A12 = A(1:(p),((p)+1):n);
A21 = -1*eye(p);
A22 = A(((p)+1):n,((p)+1):n);

%Wyznaczanie macierzy L11, L21, L22 oraz U22
L11 = A11;
L21 = A21;
U12 = zeros(p);
for i = 1:p
       U12(:,i) = Crout(A11, A12(:,i));
end
L22 = A22 + U12;

%Rozkład LU
L = [L11, zeros(p); L21, L22];
U = [eye(p), U12; zeros(p), eye(p)];

%Rozwiązywanie układów równań
b1 = b(1:(n/2));
b2 = b((n/2)+1:n);

y1 = Crout(L11, b1);
y2 = Crout(L22, (y1+b2));

x2 = y2;
x1 = y1 - U12*x2;

x = [x1; x2];



%Wskaźnik uwarunkowania macierzy
disp("Wskaźnik uwarunkowania macierzy:")
disp(cond(A))

%Błąd rozkładu
edec = norm(A-L*U)/norm(A);
fprintf("Bład rozkładu:");
disp(edec)

%Błąd względny
z = A\b;
erel = norm(x-z)/norm(z);
fprintf("Bład względny:");
disp(erel)

%Współczynnik stabilności
wspstab = norm(x-z)/(norm(z)*cond(A));
fprintf("Współczynnik stabilności:");
disp(wspstab)

%Współczynnik poprawności
wsppopr = norm(b - A*x)/(norm(A)*norm(x));
fprintf("Współczynnik poprawności:");
disp(wsppopr)


end