import numpy as np
import matplotlib.pyplot as plt
from sympy import *
from sympy import sin
import math
init_printing()
def test_1():
    t = Symbol('t')
    f = sin(t)
    ck = []
    for n in range(10):
        ck.append(diff(f,t,n).subs(t,0))
    def taylor_part(x,n):
        if n ==0:
            return ck[0]
        return taylor_part(x,n-1)/np.math.factorial(n)*x**n
    x=np.arange(-3*np.pi/2,3*np.pi/2,0.01)
    y=np.sin(x)
    clr=['gray','teal','olive','purple','maro0n']
    fig,axes=plt.subplots(nrows=2,ncols=2)
    tAx=ax0,ax1,ax2,ax3=axes.flatten()
    for n in range(1,5):
        tAx[n-1].plot(x,taylor_part(x,2*n-1),clr[n-1],zorder=10)
        tAx[n-1].plot(x,y,'r',linewidth=2,zorder=15)
        tAx[n-1].grid(True ,zorder=5)
    plt.show()
def test_2():
    coef_taylor=[]
    k=10
    s=0
    k=(k-1)/2+1
    k=int(k)
    for i in range(0, k):
        s = pow(-1, i) * pow(2*np.pi, 2 * i + 1) / math.factorial(2 * i + 1)
        coef_taylor.append(s)
    print(coef_taylor)
    def sin_taylor(x):
        sum_tay=0
        for i in range(0,k):
            sum_tay=sum_tay+coef_taylor[i]*pow(x,2*k+1)
        return sum_tay
    ploy_taylor_a=[]
    ploy_taylor_b=[]
    for i in range(0,10):
        ploy_taylor_a.append(i)
        ploy_taylor_b.append(sin_taylor(ploy_taylor_a[i]))
    print(ploy_taylor_b)
    print(ploy_taylor_a)
    plt.plot(ploy_taylor_a, ploy_taylor_b, color='g', linestyle='dashed', marker='o')
    plt.show()
def test_3():
    print("This is console module")
    def fa(a):
        b = 1
        while a != 1:
            b *= a
            a -= 1
        return b
    def taylor(x, n):
        a = 1
        count = 1
        for k in range(1, n):
            if count % 2 != 0:
                a -= (x ** (2 * k)) / fa(2 * k)
            else:
                a += (x ** (2 * k)) / fa(2 * k)
            count += 1
        return a
    def cos(x):
        return taylor(x, 10)
    print(cos(3))
if __name__ == '__main__':
    test_3()
