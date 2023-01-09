%Przykładowe macierze
A = [1 2 3 4; 5 6 7 8; -1 0 9 10; 0 -1 11 12];
b = [1; 2; 3; 4];
x = BlockCrout(A,b);
A\b;

B = [hilb(2) hilb(2); -1*eye(2) hilb(2)];
x = BlockCrout(B,b);
B\b;

C = [hilb(3) hilb(3); -1*eye(3) hilb(3)];
d = [1; 2; 3; 4; 5; 6];
x = BlockCrout(C,d);
C\d;

D = [pascal(2) pascal(2); -1*eye(2) pascal(2)];
x = BlockCrout(D,b);
D\b;

E = [1 2 1 4; 5 6 5 8; -1 0 -1 0; 0 -1 0 12];
%x = BlockCrout(E,b);
%E\b;

F = [-1/2 -1; -1 -1.999];
c1 = [4; 7.9999];
c2 = [4; 8];

x = BlockCrout(F,c1);
F\c1;

x = BlockCrout(F,c2);
F\c2;















