%% Question 1
rhs = @(t, u) [-sin(u(2)); u(1)];
rhs(0, [2; pi/4]);
[T, U] = ode45(rhs, [0 10], [0 1]);
Y = U(:, 2);
plot(T, Y);

%% Question 2a
G = 4*pi^2;
M = 1.0;
r = @(x,y) sqrt(x^2 + y^2);

rhs = @(t,u) [ ...
    u(3); ... % dx/dt = u
    u(4); ... % dy/dt = v
    -G*M*u(1) / r(u(1), u(2))^3; ... % du/dt = -GMx / r^3
    -G*M*u(2) / r(u(1), u(2))^3; ... % dv/dt = -GMy / r^3
];
[T, U] = ode45(rhs, [0 10], [1 0 0 sqrt(G*M)]);
X = U(:, 1);
Y = U(:, 2);
plot(X, Y);
axis equal;

for i = 1:length(T)
    plot(U(1:i, 1), U(1:i, 2));
    hold on;
    xlim([-1 1]);
    ylim([-1 1]);
    plot(U(i, 1), U(i, 2), "*r");
    hold off
    pause(0.05);
end

%% Question 2b
[T, U45] = ode45(rhs, [0 10], [1 0 0 sqrt(G*M)]);
[T, U23] = ode23(rhs, [0 10], [1 0 0 sqrt(G*M)]);
[T, U23t] = ode23t(rhs, [0 10], [1 0 0 sqrt(G*M)]);

hold on;
axis equal;
plot(U45(:,1), U45(:,2), 'bl');
plot(U23(:,1), U23(:,2), 'r');
plot(U23t(:,1), U23t(:,2), 'g');
legend("ode45", "ode23", "ode23t");