from math import exp

def numerical_volume(f, a, b, c, d, N):
    dx = (b - a) / N
    dy = (d - c) / N
    volume = 0

    for i in range(N):
        for j in range(N):
            square_midpoint_x = a + (i + 0.5) * dx
            square_midpoint_y = c + (j + 0.5) * dy

            volume += f(square_midpoint_x, square_midpoint_y) * dx * dy

    return volume


f = lambda x,y: (exp(x) / (2*y)) - ((4*x - 1) / (y**2))
approx_volume = numerical_volume(f, -1, 0, 1, 2, 1250)

print(f"Approximate volume under the surface: {approx_volume}")