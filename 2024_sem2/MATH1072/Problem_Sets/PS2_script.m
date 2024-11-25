f = @(x,y) x.*y.*exp(-x-y);
[X, Y] = meshgrid(-1.5:0.01:1.5);
Z = f(X,Y);
% I do this to fix the coloring of the surface... 
Z_normalised = min(max(Z, -1.51), 1.51);
surf(X,Y,Z_normalised, "EdgeAlpha", 0);
zlim([-1.5 1.5]);
view([75, 20]);
colormap("winter");

CP_X = [0 1 0 1];
CP_Y = [0 0 1 1];
CP_Z = f(CP_X, CP_Y);
hold on;
plot3(CP_X, CP_Y, CP_Z, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

set(gcf, 'Position', [100, 20, 600, 600])
title("$f(x,y) = xye^{-x-y}$", "Interpreter", "latex", "FontSize", 48);
xlabel("$x$", "FontSize", 24, "Interpreter", "latex");
ylabel("$y$", "FontSize", 24, "Interpreter", "latex");
zlabel("$z$", "FontSize", 24, "Interpreter", "latex");
% saveas(gcf, "./PS2_fig1.pdf");
% saveas(gcf, "./PS2_fig1.png");
negf = @(v) -f(v(1),v(2));
maxima = fminsearch(negf, [3, 3]);
fprintf('Local maximum found at (x, y) = (%.4f, %.4f)\n', maxima(1), maxima(2));
