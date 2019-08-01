#当 p=q 时，图形是对称的
#当 p≠q 时，图形呈偏态，p<q 与 p>q 的偏斜方向相反
#当 (n+1)p 不为整数时，二项概率 P(X=k) 在 k=(n+1)*p 时达到最大值
#当 (n+1)p 为整数时，二项概率 P(X=k) 在 k=(n+1)*p 和 k=(n+1)*p-1 时达到最大值
#NOTE：当 n 很大时，即使 p≠q，二项分布概率直方图的偏态也会逐渐降低，最终成为正态分布。
#也就是说，二项分布的极限情形即为正态分布，故当 n 很大时，二项分布的概率可用正态分布的概率作为近似值。
#一般规定，当 p<q 且 np≥5，或 p>q 且 nq≥5 时，这时的 n 就足够大了，可以用正态分布的概率作为近似值。
#则正态分布参数 μ=np，σ^2=np(1-p) 。

from scipy.stats import binom
import matplotlib.pyplot as plt
import numpy as np
fig,ax = plt.subplots(1,1)
n = 1000000
p = 0.5
#平均值, 方差, 偏度, 峰度
mean,var,skew,kurt=binom.stats(n,p,moments='mvsk')
print(mean,var,skew,kurt)
#ppf:累积分布函数的反函数。q=0.01时，ppf就是p(X<x)=0.01时的x值。
x=np.arange(binom.ppf(0.01,n,p),binom.ppf(0.99,n,p))
ax.plot(x,binom.pmf(x,n,p),'o')
plt.rcParams['font.sans-serif']=['SimHei']
plt.title(u'二项分布概率质量函数')
plt.savefig(r'D:\大学资料\Programming Language\Python\算法模板\数学规划\伯努利分布')
plt.show()
