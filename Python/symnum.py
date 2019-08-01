import numpy as np
from sympy.plotting import plot_parametric
from math import sqrt
from sympy import *
def fu():
    n=Symbol('n',integer=True)
    init_printing()
    f1=(2*n-1)/(2**n)
    print(Sum(f1,(n,1,oo)).doit())
    f2=(1)/(n*(n*2+1))
    print(Sum(f2,(n,1,oo)).doit())
    #无法对第二个结果进行符号化表示
def practice():
    n, x = symbols('n x',integer=True)
    init_printing()
    f3 = sin(x)/n**2
    f4 = (-1)**(n-1)*x**n/n
    print(Sum(f3, (n, 1, oo)).doit())
    print(Sum(f4, (n, 1, oo)).doit())
def functions():
    n=Symbol('n',integer=True)
    init_printing()
    funs=1/(n**4)
    fun=1/(n**6)
    print(Sum(funs,(n,1,oo)).doit())
    print(Sum(fun,(n,1,oo)).doit())
def fc():
    n=Symbol('n',integer=True)
    init_printing()
    funcs=1/n
    w=Sum(funcs,(n,1,oo)).doit()
    h=Sum(ln(n),(n,1,oo)).doit()
    print(w-h)#结果错误
def timestamp():
    n, x, m=symbols('n x m',integer=True)
    init_printing()
    f1=(-1)**n *((3*n)/(2**n))
    f2=(2*n-1)/(sqrt(2))**n
    f3=(-1)**(n+1)/(n+1)**2
    f4=x/(n*(n+1))
    f5=(-1)**(n+1)*x/(n+5)*n
    f6=3**(m+1)/(2**m)
    print(Sum(f1,(n,1,50)).doit())
    print(Sum(f2,(n,2,50)).doit())
    print(Sum(f3,(n,1,50)).doit())
    print(Sum(f4,(n,1,50)).doit())
    print(Sum(f5,(n,1,50)).doit())
    print(Sum(f6,(m,0,n-1)).doit())
def forplay():
    n = Symbol('n',integer=True)
    init_printing()
    f1=1/(2**(2*n-1)*(2*n-1))
    f2=(-1)**n*(1-((n-1)**2)/(n+1))
    f3=1/(n**2)*sin(n)
    f4=(-1)**n/n**(1/n)
    print(series(f1, 0,n,50))
    print(series(f2, 0,n,50))
    print(series(f3, 0,n,50))
    print(series(f4, 0,n,50))
def plot():
    n = Symbol('n',integer=True)
    f1=1/n
    f2=1/n**2
    f3=(2*n-1)/2**n
    f4=(2*n-1)/(sqrt(2)**n)
    plot_parametric(f1,n,(n,0,50))
    plot_parametric(f2,n,(n,0,50))
    plot_parametric(f3,n,(n,0,50))
    plot_parametric(f4,n,(n,0,50))
if __name__=='__main__':
    #fu()
    #practice()
    #functions()
    #fc()
    #timestamp()
    #forplay()
    plot()