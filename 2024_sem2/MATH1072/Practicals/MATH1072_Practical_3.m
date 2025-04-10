%% Question 1
figure(1);
clf(1);
view(3);
hold on;
%%% (A)
z = @( x ) 3*(1-x(1) ).^2 .* exp(-(x(1).^2) - (x(2)+1).^2) - ...
  10*(x(1)/5 - x(1).^3 - x(2).^5) .* exp(-x(1).^2 - x(2).^2) - ...
  1/3*exp(-(x(1)+1).^2 - x(2).^2);
%%% (B)
xymin = fminsearch(z, [-1, 1])
%%% (C)
negz = @( x ) -z(x);
xymax = fminsearch(negz, [-1, 1])
%%% (D)
Z = @( x,y ) 3*(1-x ).^2 .* exp(-(x.^2) - (y+1).^2) - ...
  10*(x/5 - x.^3 - y.^5) .* exp(-x.^2 - y.^2) - ...
  1/3*exp(-(x+1).^2 - y.^2);
[X, Y] = meshgrid(-2:0.05:2, -2:0.05:2);
surf(X, Y, Z(X,Y), "EdgeAlpha", 0.2);
%%% (E)
plot3(xymin(1), xymin(2), z(xymin), 'r.', 'MarkerSize', 32);
plot3(xymax(1), xymax(2), z(xymax), 'r.', 'MarkerSize', 32);
%%% (F)
xymin_2 = fminsearch(z, [0, -1])
plot3(xymin_2(1), xymin_2(2), z(xymin_2), 'g.', 'MarkerSize', 32);


%% Question 2
figure(2);
clf(2);
hold on;
%%% (A)
contour(X, Y, Z(X, Y), "LevelStep", 0.5);
%%% (B)
fimplicit (@(x, y) 2*x + y - 1, [-2, 2]);
%%% (C)
xyminc = fmincon(z, [0, 0], [], [], [2, 1], 1);
plot(xyminc(1), xyminc(2), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
%%% (D)
xymaxc = fmincon(negz, [-1, 1], [], [], [2, 1], 1);
plot(xymaxc(1), xymaxc(2), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);