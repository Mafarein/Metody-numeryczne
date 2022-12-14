function [] = wykres(a,b,n,f)
% Rysowanie wykresu funkcji f oraz jej wielomianu interpolacyjnego
% w przedziale [a,b] stopnia n. Dodatkowo błąd i wielomian przy użyciu
% wbudowanych funkcji
% Wejście:
% a,b - końce przedziału
% n - stopień wielomianu interpolacyjnego
% f - funkcja

r = linspace(a,b,10000);
yf = f(r);

% Interpolacja 
x = linspace(a,b,n+1);
g = f(x);
c = wspolczynniki(x,g); 
yn = newton(c,x,r);

% Błąd
h = blad(yf, yn);

% Wbudowane funkcje Matlaba
p = polyfit(x,g,n);
i = polyval(p,r);



figure, plot(r,yf,"r-",r,i,'m-',r,yn,'b-',r,h,'g-',x,g,'y.',"MarkerSize",20);
legend("Funkcja", "Wbudowana funkcja interpolująca","Wielomian interpolacyjny", "Błąd", "Węzły")
grid on