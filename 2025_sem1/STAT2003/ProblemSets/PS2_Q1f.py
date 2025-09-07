import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import binom, hypergeom

# Parameters
n = 4
p = 14/20

# Support (possible number of successes)
x = np.arange(0, n+1)

# Binomial CDF
binom_cdf = binom.cdf(x, n, p)

# Hypergeometric CDFs
N_values = [10, 20, 100]
hypergeom_cdfs = []

for N in N_values:
    N_success = int(p * N)  # Number of successes in the population
    rv = hypergeom(N, N_success, n)
    hypergeom_cdfs.append(rv.cdf(x))

# Plot
plt.figure(figsize=(8, 6))
plt.step(x, binom_cdf, where="post", label="Binomial CDF (n=4, p=0.7)", linewidth=2)

for N, cdf in zip(N_values, hypergeom_cdfs):
    plt.step(x, cdf, where="post", label=f"Hypergeometric CDF (N={N})", linestyle='--')

plt.xlabel("Number of successes")
plt.ylabel("CDF")
plt.title("Binomial vs Hypergeometric CDFs")
plt.legend()
plt.grid(True)
plt.show()
