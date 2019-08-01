import numpy as np
import matplotlib.pyplot as plt
from sympy import *
def test_1():
    x,n=symbols('x n',integer=True)
    init_printing()
    f=x**2
    a0=(integrate(f, (x, -1*pi, pi)))/pi
    an=(integrate(f*cos(n*x),(x,-1*pi,pi)))/pi
    bn=(integrate(f*sin(n*x),(x,-1*pi,pi)))/pi
    print(a0)
    print(an)
    print(bn)
def test_2():
    k,x=symbols('k x',integer=True)
    init_printing()
    f=x**2
    a0=(integrate(f,(x,-1*pi,pi)))/pi
    ak = (integrate(f * cos(k * x), (x, -1 * pi, pi))) / pi
    bk = (integrate(f * sin(k * x), (x, -1 * pi, pi))) / pi
    print(a0)
    print(ak)
    print(bk)
def test_3():
    x = np.linspace(-3 * np.pi, 3 * np.pi, 1024)
    y0 = 0.5 * np.ones(x.size)
    y1 = 0.673 * np.cos(x)
    y2 = -0.212 * np.cos(3 * x)
    y3 = 0.127 * np.cos(5 * x)
    y = y0 + y1 + y2 + y3
    plt.plot(x, y0, 'g:')
    plt.plot(x, y1, 'y:')
    plt.plot(x, y2, 'm:')
    plt.plot(x, y3, 'c:')
    plt.plot(x, y, 'r')
    plt.show()
def test_4():
    x0 = np.arange(-3 * np.pi, -np.pi, 0.01)
    x1 = np.arange(-np.pi, np.pi, 0.01)
    x2 = np.arange(np.pi, 3 * np.pi, 0.01)
    y0 = x0 + 2 * np.pi
    y1 = x1
    y2 = x2 - 2 * np.pi
    t = np.array([-3 * np.pi, -2 * np.pi, -np.pi, -np.pi, 0, np.pi, np.pi, 2 * np.pi, 3 * np.pi])
    y = np.array([-np.pi, 0, np.pi, -np.pi, 0, np.pi, -np.pi, 0, np.pi])
    fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(9, 4))
    axes[0].plot(x0, y0, 'g')
    axes[0].plot(x1, y1, 'g')
    axes[0].plot(x2, y2, 'g')
    axes[0].plot(t, y, 'ko', markerfacecolor='none')
    axes[0].grid()
    axes[1].plot(x0, abs(y0), 'g')
    axes[1].plot(x1, abs(y1), 'g')
    axes[1].plot(x2, abs(y2), 'g')
    axes[1].plot(t, abs(y), 'ko', markerfacecolor='none')
    axes[1].grid()
    plt.show()
if __name__=='__main__':
    #test_1()
    #test_2()
    test_3()
    #test_4()