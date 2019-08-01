#指数分布是一种连续概率分布，用于表示独立随机事件发生的时间间隔。
# 如旅客进入机场的时间间隔、打进客服中心电话的时间间隔、中文维基百科新条目出现的时间间隔等等。

import math
import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

#我将参数λ设置为0.5，并将x的取值范围设置为 $[0, 15]$ 。

lambd = 0.5
x = np.arange(0,15,0.1)
y = lambd * np.exp(-lambd*x) #could also use stats.expon.pdf
plt.plot(x,y)
plt.title("Exponential: $lamdba$ = %.2f" %(lambd))
plt.xlabel("x")
plt.ylabel("Probability density")
plt.show()

data = stats.expon.rvs(scale = 2, size = 1000)
print("Mean: %g" %(np.mean(data)))
print("SD: %g" %(np.std(data,ddof=1)))

plt.figure()
plt.hist(data,bins = 20,density = True)
plt.xlim(0,15)
plt.title("Simulating Exponential Random Variables.")
plt.show()