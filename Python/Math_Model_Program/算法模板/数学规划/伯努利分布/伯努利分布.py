#二项分布：离散型概率分布，n重伯努利分布
#可见，n 重伯努利试验需满足下列条件：

#每次试验只有两种结果，即 X=1，或 X=0
#各次试验中的事件互相独立，且 X=1 和 X=0 的概率分别为 p(0<p<1) 和 q=1-p
#n 重伯努利试验的结果就是 n 重伯努利分布，即二项分布。
#反之，当 Xn(n=1) 时，二项分布的结果服从于伯努利分布。
#因为二项分布实际上是进行了 n 次的伯努利分布，所以二项分布的离散型随机变量期望为 E(x)=np，方差为 D(x)=np(1-p) 。

from scipy.stats import binom  # 导入伯努利分布
import matplotlib.pyplot as plt
import numpy as np
# 次数
n = 10
# 概率
p = 0.3
# 导入特征系数
k = np.arange(0, 21)
# 伯努利分布的特征值导入
binomial = binom.pmf(k, n, p)
plt.plot(k, binomial, 'o-')
plt.title('Binomial: n = %i, p=%0.2f' % (n, p), fontsize=15)
plt.xlabel('Number of successes')
#plt.savefig(r"D:\大学资料\Programming Language\Python\Math_Model_Program\算法模板\数学规划")
plt.ylabel('Probability of sucesses', fontsize=15)
plt.show()