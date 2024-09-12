clear;
clc
%% (A)
syms x y;
F(x,y) = [y^2 - 2, 2*x*y];

%% (B)
F1(x,y) = y^2 - 2;
F2(x,y) = 2*x*y;
dF1y = diff(F1, y);
dF2x = diff(F2, x);

%% (C)
fx = int(F1, x);
fxdy = diff(fx, y);
c = fxdy - F2;
c = int(c, y);
f(x,y) = fx + c;
work = f(2,1) - f(0,0);

%% (D)
syms t;
rx(t) = 2 * t;;
ry(t) = t^2;;
drdt(t) = [diff(rx, t); diff(ry, t)];
F_int = int(F(rx, ry) * drdt, t, 0, 1);

%% (E)
[X, Y] = meshgrid(-2:0.1:2);
quiver(X, Y, F1(X,Y), F2(X,Y), 2);
xlim([-1 1])
ylim([-1 1])

%% (F)
G(x,y) = [y -x]
Gx(x,y) = y
Gy(x,y) = -x
quiver(X, Y, Gx(X,Y), Gy(X,Y), 2);
xlim([-2 2]);
ylim([-2 2])

rx(t) = cos(t);
ry(t) = sin(t);
drdt = diff([rx; ry], t)
G_int = int(G(rx, ry) * drdt, t, 0, 2*pi)
hold on;
fplot(rx, ry, [0, 2*pi]);
