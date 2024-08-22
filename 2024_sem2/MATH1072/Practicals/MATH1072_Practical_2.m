%% Question 1
%%% Part A
z = @(x) (x.^3 ./ 2) + x.^2;
x = linspace(-1, 1, 100);
plot(x, z(x));
hold on;

%%% Part B
dz = @(x) ((3 .* x.^2) ./ 2) + 2 .* x;
f1 = @(x) z(0) + (dz(0).*(x - 0));
plot(x, f1(x));

%%% Part C
E1 = @(x) abs(f1(x) - z(x));
E1_1 = E1(0.5);
E1_2 = E1(0.8);
disp("abs(f1(x) - z(x))");
disp([0.5 E1_1; 0.8 E1_2]);

%%% Part D
ddz = @(x) (3 .* x) + 2;
f2 = @(x) z(0) + dz(0).*(x - 0) + ddz(x).*(x - 0).^2;
plot(x, f2(x));
xlabel("$x$", "FontSize", 24, "Interpreter", "latex");
ylabel("$y$", "FontSize", 24, "Interpreter", "latex");
legend("$z(x)=\frac{x^3}{2}+x^2$", ...
    "$f_1(x)=f(0) + f'(0)(x)$", ...
    "$f_2(x)=f(0) + f'(0)(x) + f''(0)(x)^2$", ...
    "location", "northwest", "interpreter", "latex")
hYLabel = get(gca,'YLabel');
set(hYLabel,'rotation',0,'VerticalAlignment','middle');
hold off;

%%% Part E
E2 = @(x) abs(f2(x) - z(x));
E2_1 = E2(0.5);
E2_2 = E2(0.8);
disp("abs(f2(x) - z(x))");
disp([0.5 E2_1; 0.8 E2_2]);

%% Question 2
%%% Part A
[X, Y] = meshgrid(-1:0.1:1, -1:0.1:1);
Z = @(x, y) x.^2 + (y.^2 .* (1 - x).^3);
surf(X, Y, Z(X,Y));
colormap spring;
hold on;

%%% Part B
dzX = @(x,y) (2.*x) - (3 .* (y.^2) .* (1-x).^2);
dzY = @(x,y) 2.*y .* (1-x).^3;
F1 = @(x, y) Z(-1,0) + dzX(-1,0).*(x+1) + dzY(-1,0).*(y-0);
surf(X, Y, F1(X,Y));
xlabel("$x$", "FontSize", 24, "Interpreter", "latex");
ylabel("$y$", "FontSize", 24, "Interpreter", "latex");
zlabel("$z$", "FontSize", 24, "Interpreter", "latex");
hold off;

%%% Part C
EE1 = abs(F1(-1,0) - Z(-1,0));
EE2 = abs(F1(-1.1,0.2) - Z(-1.1,0.2));
disp("abs(F(x, y) - Z(x, y))");
disp([-1 0 EE1; -1.1 0.2 EE2]);

%%% Part D
eps1 = 0.1;
eps2 = 1;
absE = abs(dzX(-1,0).*eps1) + abs(dzY(-1,0).*eps2);
disp(absE);
