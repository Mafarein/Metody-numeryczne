function [x] = Crout(A, b)
% Funkcja wykonuje rozkład LU w postaci Crouta
% Następnie rozwiązuje układ liniowy Ax = b
% Parametry wejścia:
% A, b - macierz R^(nxn) i wektor układu R^n
% Parametr wyjścia:
% x - wektor rozwiązania R^n

n=length(A(1,:));
L = diag(ones(1,n)); 
U = diag(ones(1,n)); 

%rozklad LU
for k = 1:n
    for i = k:n
        L(i,k)=A(i,k);
            for p=1:k-1
                L(i,k)=L(i,k)-L(i,p)*U(p,k);
            end
            
    for j = k+1:n
        U(k,j)=A(k,j);
        for p=1:k-1
            U(k,j)=U(k,j)-L(k,p)*U(p,j);
        end
        U(k,j)=U(k,j)/L(k,k);
    end
    end
end

%Ly = b
y=zeros(n,1);
y(1) = b(1)/L(1,1);
for k =2:n
    y(k) = (b(k) - L(k,1:k-1)*y(1:k-1))/L(k,k);
end

%Ux = y
x=zeros(n,1);
x(n) = y(n)/U(n,n);
for k=n-1:-1:1
    x(k) = (y(k) - U(k,k+1:n)*x(k+1:n))/U(k,k);
end

end