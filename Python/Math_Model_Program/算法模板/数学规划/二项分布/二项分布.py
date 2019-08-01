#抛硬币，20次，每一次朝上的概率是0.3.连续几次正面朝上的概率图
#需要注意的是，满足二项分布的样本空间有一个非常重要的性质，假设进行 n 次独立试验，
#满足二项分布（每次试验成功的概率为 p，失败的概率为 1−p），
#那么成功的次数 X 就是一个参数为 n 和 p 的二项随机变量，即满足下述公式：
#P(X=k) = C(n, k) * p^k * (1-p)^(n-k)
#X=k，试验 n 次，成功的次数恰好有 k 次的随机变量（事件）
#C(n, k)，表示从集合 n 中取出 k 个元素的组合数，结果为 n!/(k!*(n-k)!)

import numpy as np
import matplotlib.pyplot as plt
import math
from scipy import stats

n = 20
p = 0.3
k = np.arange(0, 41)
print(k)
print("*" * 20)
binomial = stats.binom.pmf(k, n, p)
print(binomial)

plt.plot(k, binomial, 'o-')
plt.title('binomial:n=%i,p=%.2f' % (n, p), fontsize=15)
plt.xlabel('number of success')
plt.ylabel('probalility of success', fontsize=15)
plt.grid(True)
plt.show()

binom_sim = data = stats.binom.rvs(n = 20,p = 0.3, size = 10000)
print("Mean: %g." %(np.mean(binom_sim)))
print("SD: %g." %(np.std(binom_sim,ddof = 1)))
plt.hist(binom_sim,bins = 10,density = True) #normed
plt.xlabel("x")
plt.ylabel("density")
plt.show()