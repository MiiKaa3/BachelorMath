clc; clear; clf;

hold on;
for inital_pop = 20:1:50
  P = @(t) (21/log(2)) + (inital_pop - (21/log(2)))*2.^t;
  t = 0:1:100;
  y = P(t);
  plot(t,y, 'r',  "LineWidth", 1);
end

title("$P(t) = \frac{21}{\ln2} + \left( P_0 - \frac{21}{\ln2}) \right)2^t$"...
  , "Interpreter", "latex", "FontSize", 48);
xlabel("$t$", "FontSize", 24, "Interpreter", "latex");
ylabel("$P$", "FontSize", 24, "Interpreter", "latex");
saveas(gcf, "./PS3_fig2.png");
