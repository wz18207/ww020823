#β分布是一个取值在 [0, 1] 之间的连续分布，它由两个形态参数α和β的取值所刻画。
#β分布的形状取决于α和β的值。贝叶斯分析中大量使用了β分布。

import math
import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

alpha = 0.5
beta = 0.5
x = np.arange(0.01,1,0.01)
y = stats.beta.pdf(x,alpha,beta)
plt.plot(x,y)
plt.title('Beta :alpha=%.1f, beta=%.1f' %(alpha,beta))
plt.xlabel('x')
plt.ylabel('Probability density')
plt.show()