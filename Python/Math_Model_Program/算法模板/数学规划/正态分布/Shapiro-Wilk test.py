#算法一：
#方法：scipy.stats.shapiro(x)
#参数：x - 待检验数据
#返回：W - 统计数；p-value - p值
from scipy import stats
import numpy as np
np.random.seed(12345678)
x = stats.norm.rvs(loc=5, scale=3, size=100)
print(stats.shapiro(x))