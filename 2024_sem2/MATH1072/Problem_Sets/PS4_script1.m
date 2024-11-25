% Defining our given parameters
k1 = 2;
k2 = 0.5;
m1 = 3;
m2 = 1;
t_range = [0 200];
% The inital conditions
% Inital position and velocity are both 0
% i.e. The system starts at equilibrium
y0 = [0; 0; 0; 0];

% Defining the system, according to what we derived in the
% previous question. Note that y(1) = x_1(t), y(3) = x_2(t)
% and y(2) = v_1(t) = \dot{x}_1(t), y(4) = v_2(t) = \dot{x}_2(t). 
system = @(t, y) [
  y(2);
  (sin(t) + k2 * (y(3) - y(1)) - k1 * y(1)) / m1;
  y(4);
  (exp(-t) + k2 * (y(1) - y(3)) - 2 * k2 * y(3)) / m2;
];

[t, y] = ode45(system, t_range, y0);

% Plot the results. The displacement results are stored in
% y(:, 1 and 3). Whereas the velocity results are stored
% in y(:, 2 and 4). We'll plot and present the displacements
% of m_1 and m_2 over time. The question was a little vauge
plot(t, y(:, 1), 'b--', 'LineWidth', 1.5); hold on;
plot(t, y(:, 3), 'r-', 'LineWidth', 1.5);
set(gca, 'FontSize', 18);
box off;
title('Displacements of $m_1$ and $m_2$ for $t\in[0,200]$', 'FontSize', 36, 'Interpreter', 'latex');
xlabel('Time $(t)$', 'FontSize', 36, 'Interpreter', 'latex');
ylabel('Displacement $(x_1, x_2)$', 'FontSize', 36, 'Interpreter', 'latex');
legend('$x_1(t)$', '$x_2(t)$', 'FontSize', 36, 'Interpreter', 'latex');
saveas(1, '../Problem_Sets/PS4_fig1.png')