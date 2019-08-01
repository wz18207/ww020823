#标准的正态分布直方图
#假设随机变量X服从一个位置参数为μ、尺度参数为σ的正态分布，则可以记为：
#X∼N(μ,σ^2)
#而概率密度函数为
#f(x)=(1/σ*√2π)*e^(-(x−μ)^2/(2*pi^2))
import numpy as np
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
def choose_task():
    while True:
        print("1.样本数为1000的标准正态分布直方图。")
        print("2.样本数为1000000的标准正态直方图。")
        print("3.正态直方图与概率分布曲线。")
        print("0.退出程序")
        a = int(input("The number you want to input:"))
        if a == 1: demo1()
        elif a == 2:demo2()
        elif a == 3:demo3()
        elif a == 0:exit()
#样本数为1000。
def demo1():
    mu ,sigma = 0, 1
    sampleNo = 1000
    np.random.seed(0)
    s = np.random.normal(mu, sigma, sampleNo)
    plt.hist(s, bins=100, normed=True)
    plt.show()
#样本数为1000000。
def demo2():
    mu ,sigma = 0, 1
    sampleNo = 1000000
    np.random.seed(0)
    s = np.random.normal(mu, sigma, sampleNo)
    plt.hist(s, bins=100, normed=True)
    plt.show()
#画直方图与概率分布曲线.
def demo3():
    mu, sigma , num_bins = 0, 1, 50
    x = mu + sigma * np.random.randn(1000000)
    # 正态分布的数据
    n, bins, patches = plt.hist(x, num_bins, normed=True, facecolor = 'blue', alpha = 0.5)
    # 拟合曲线
    y = mlab.normpdf(bins, mu, sigma)
    plt.plot(bins, y, 'r--')
    plt.xlabel('Expectation')
    plt.ylabel('Probability')
    plt.title('histogram of normal distribution: $\mu = 0$, $\sigma=1$')

    plt.subplots_adjust(left = 0.15)
    plt.show()
choose_task()