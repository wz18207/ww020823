#E(X) = μ, Var(X) = σ2

import numpy as np
import matplotlib.pyplot as plt
import math
from scipy import stats

mu = 0 #mean
sigma = 1 #Standard deviation
x = np.arange(-10,10,0.1)

y = stats.norm.pdf(x,0,1)
plt.plot(x,y)
plt.title("Normal: $\mu$=%.1f, $\sigma^2$=%.1f" %(mu,sigma))
plt.xlabel('x')
plt.ylabel('Probability density') #probability of ovserving each of these observations
plt.show()
