%% Assignment Question 3
f = @(x, y) (y*x^3 - x*y^3) / (x^2 + y^2);
[x, y] = meshgrid(-5:0.01:5, -5:0.01:5);
surf(x, y, arrayfun(f, x, y), "EdgeAlpha", 0.04);

% Make it look pretty :)
title("\(f(x,y)=\frac{x^3y-xy^3}{x^2+y^2}\)", "FontSize", 36, ...
    "Interpreter", "latex")
subtitle("in a neighbourhood of \((x,y)=(0,0)\)", "FontSize", 16, ...
    "Interpreter", "latex")
posX=50; posY=50; width=800; height=800;
set(gcf, "Position", [posX, posY, width, height]);
colormap("winter");
box on;
