%% Question 1
H = [1, 0.5, 0.25, 0.1];
f = @(x) cos(x);
plot(0:0.01:2, -sin(0:0.01:2), 'k', 'LineWidth', 2)
hold on
for h = H
    x = 0:h:2;
    df = (f(x + h) - f(x)) ./ h;
    plot(x, df);
end
legend("\( f'(x) \)", "\( h=1 \)", "\( h=0.5 \)", "\( h=0.25 \)",...
"\( h=0.1 \)", "FontSize", 12, "Interpreter", "latex")
disp("We observe that, as x gets smaller, the shape of the" + ...
"approximation approaches the shape of the analytic solution.")

%% Question 2
h = 0.1;
Dx = -2:h:2;
Dy = -2:h:2;
[X , Y ] = meshgrid (Dx, Dy);
f = @(x, y) cos(x) + sin(y);
dfx = @(x, y) (f(x+h, y) - f(x, y)) / h;
dfy = @(x, y) (f(x, y+h) - f(x, y)) / h;
contour (X, Y, f(X, Y)); % plot the 2 D function
hold on;
quiver(X, Y, dfx(X, Y), dfy(X, Y));
