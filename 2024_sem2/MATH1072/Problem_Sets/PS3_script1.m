clc; clear; clf;

P = @(t) (21/log(2)) + (100 - (21/log(2)))*2.^t;
t = 0:1:100;
y = P(t);
plot(t,y, 'bx',  "LineWidth", 4);
title("$P(t) = \frac{21}{\ln2} + \left( 100 - \frac{21}{\ln2}) \right)2^t$"...
  , "Interpreter", "latex", "FontSize", 48);
xlabel("$t$", "FontSize", 24, "Interpreter", "latex");
ylabel("$P$", "FontSize", 24, "Interpreter", "latex");
saveas(gcf, "./PS3_fig1.png");
