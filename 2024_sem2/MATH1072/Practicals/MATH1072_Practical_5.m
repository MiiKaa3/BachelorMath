clear;
clc;
clf("reset");

%% Question 1
function [t, y] = compute_y(h, y_0)
  t = 0:h:10;
  y = zeros(size(t));
  y(1) = y_0;
  dy_dt = @(t, y) sin(t + y);
  for i = 2:length(t)
    y(i) = y(i - 1) + dy_dt(t(i-1), y(i-1)) * h;
  end
  plot(t,y);
  hold on;
end

% Part (a)
[t1, y1] = compute_y(0.1, 0);

% Part (b)
[t2, y2] = compute_y(10e-6, 0);

% Part (c)
plot(t1, y1, "LineWidth", 2);
hold on;
plot(t2, y2, "LineWidth", 2);
xlim([0 3]);


%% Question 2
% Part (a)
dy_dt = @(t, y) sin(t + y);
[T, Y] = ode45(dy_dt, [0, 10], 0);

% Part (b)
plot(T, Y, "LineWidth", 2);

% Part (c)
solution = ode45(dy_dt, [0, 10], 0);
yVal = deval(solution, 1.3)


%% Question 3
rhs = @(t, y) t - y;
y0_vec = -0.5:0.0001:0.5;
soln = ode45(rhs, [0, 1], y0_vec);
y1_vec = deval(soln, 1);
[err, index] = min(abs(y1_vec - 0.5));
best_y0_estimate = y0_vec(index)
best_soln = ode45(rhs, [0, 1], best_y0_estimate);
figure();
plot(best_soln.x, best_soln.y);
