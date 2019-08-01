#算法二：
#方法：scipy.stats.kstest (rvs, cdf, args = ( ), N = 20, alternative ='two-sided', mode ='approx')
#参数：rvs - 待检验数据，可以是字符串、数组；
#cdf - 需要设置的检验，这里设置为 norm，也就是正态性检验；
#alternative - 设置单双尾检验，默认为 two-sided

from scipy import stats
import numpy as np
x = np.linspace(-15, 15, 9)
print(stats.kstest(x, 'norm'))

np.random.seed(987654321) # set random seed to get the same result
print(stats.kstest('norm', False, N=100))

#The above lines are equivalent to:
np.random.seed(987654321)
print(stats.kstest(stats.norm.rvs(size=100), 'norm'))

#Test against one-sided alternative hypothesis
#Shift distribution to larger values, so that cdf_dgp(x) < norm.cdf(x):
np.random.seed(987654321)
x = stats.norm.rvs(loc=0.2, size=100)
print(stats.kstest(x,'norm', alternative = 'less'))

#Reject equal distribution against alternative hypothesis: less
print(stats.kstest(x,'norm', alternative = 'greater'))

#Don’t reject equal distribution against alternative hypothesis: greater
print(stats.kstest(x,'norm', mode='asymp'))

#Testing t distributed random variables against normal distribution
#With 100 degrees of freedom the t distribution
#looks close to the normal distribution, and the K-S test does not reject
#the hypothesis that the sample came from the normal distribution:
np.random.seed(987654321)
print(stats.kstest(stats.t.rvs(100,size=100),'norm'))

#With 3 degrees of freedom the t distribution looks sufficiently different from
# the normal distribution, that we can reject the hypothesis that the sample came from
# the normal distribution at the 10% level:
np.random.seed(987654321)
print(stats.kstest(stats.t.rvs(3,size=100),'norm'))