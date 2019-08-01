#已知某路口发生事故的比率是每天2次，那么在此处一天内发生4次事故的概率是多少？
#泊松分布的实现和二项分布有些类似，在泊松分布中我们需要指定比率参数。
#泊松分布的输出是一个数列，包含了发生0次、1次、2次，直到10次事故的概率。我用结果生成了以下图片。

import numpy as np
import matplotlib.pyplot as plt
import math
from scipy import stats

rate = 2
n = np.arange(0,10)
y = stats.poisson.pmf(n,rate)
print(y)

data = stats.poisson.rvs(mu = 2,loc = 0, size = 1000)
print("Mean: %g."%(np.mean(data)))
print("SD:%g." %(np.std(data,ddof=1)))

plt.figure()
plt.hist(data,bins = 9,density = True)
plt.xlim(0,10)
plt.xlabel("Number of accidents")
plt.title("Simulating Possion Random Variables.")
plt.show()