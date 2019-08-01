import numpy
from mpl_toolkits.mplot3d import Axes3D
from scipy import integrate
from matplotlib import pyplot

def fun_g(x):
    return x^2+x-2

N = 10000
x = numpy.np.linspace(-3,3,N)
dx = 2./N
y = fun_g(x)
area = sum(dx * y)
print (numpy.np.trapz(y,x))
a= integrate.quad(fun_g,-2,1)
print(a * 2)
fing = pyplot.figure()
ax = Axes3D(fing)

