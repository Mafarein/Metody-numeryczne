
a = input("Dolny zakres przedziału: ");
b = input("Dolny zakres przedziału: ");

f1 = @(x) x.^8 + x.^5 - x.^2 + 2;
wykres(a,b,8,f1);
xlabel("x")
ylabel("y")
title("x^8 + x^5 - x^2 + 2")

f2 = @(x) sin(x);
wykres(a,b,3,f2);
xlabel("x")
ylabel("y")
title("sin(x)")

f3 = @(x) 1./(1+exp((-5).*x));
wykres(a,b,8,f3);
xlabel("x")
ylabel("y")
title("1/(1+exp((-5)*x))")

f4 = @(x) exp(x);
wykres(a,b,5,f4);
xlabel("x")
ylabel("y")
title("exp(x)")

f5 = @(x) abs(x);
wykres(a,b,10,f5);
xlabel("x")
ylabel("y")
title("|x|")

f6 = @(x) 1./(25.*(x.^2)+1);
wykres(a,b,10,f6);
xlabel("x")
ylabel("y")
title("Funkcja Rungego: 1/(25*(x^2)+1)")

