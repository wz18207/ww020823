from math import pi
from math import exp
from math import cos
from math import sqrt
from matplotlib import cm
import numpy as np
import numpy.matlib
import matplotlib.pyplot as plt
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
def gas():
    v = np.linspace(0,2000,10000)
    m=20.18*1.66*10**(-27)
    k=1.381*10**(-23)
    t1=273;t2=500
    f1=4*pi*((m/(2*pi*k*t1))**(3/2))*(np.exp(-m*v^2/2*k*t1)*v**2)
    f2=4*pi*((m/(2*pi*k*t2))**(3/2))*(np.exp(-m*v^2/2*k*t2)*v**2)
    plt.figure()
    plt.subplot(2,1,1)
    plt.plot(v,f1,title=u'T1=273K',linewidth=3,linstyle='-',color='r')
    plt.legend(loc='best', title='T1=273K,M=Ne')
    plt.subplot(2,2,1)
    plt.plot(v,f2,title=u'T=500K',linewidth=3,linstyle='-',color='b')
    plt.legend(loc='best',title='T2=500K,M=Ne')
    plt.legend()
    plt.show()
def cost():
    x = np.linspace(-1,1,1000)
    y = np.cos(1/x)
    plt.figure()
    plt.plot(x,y,label=u'y=cos(1/x)',linewidth=2,linestyle='-',color='g')
    plt.legend(loc = 'lower right')
    plt.show()
def function():
    x = np.linspace(-100,100,10000)
    y = x**3
    plt.figure()
    plt.plot(x,y,label=u'y = x^3',linewidth=2,linestyle='-',color='g')
    plt.legend(loc='lower right')
    plt.show()
def function2():
    mpl.rcParams['legend.fontsize'] = 10
    t = np.linspace(-100,100,10000)
    x = 2*t;y=np.sin(t);z=np.cos(t)
    fig=plt.figure()
    ax = fig.gca(projection='3d')
    ax.plot(x,y,z,label=u'x,y,z',linewidth=2,linestyle='-',color='g')
    ax.legend(loc='best')
    plt.show()
def plot_opaque_cube(x=10, y=20, z=30, dx=40, dy=50, dz=60):
    mpl.rcParams['legend.fontsize'] = 10
    plt.rcParams['axes.unicode_minus'] = False
    plt.rcParams['font.sans-serif'] = ['SimHei']
    fig = plt.figure()
    ax = fig.add_subplot(1, 1, 1, projection='3d')

    xx = np.linspace(x, x + dx, 2)
    yy = np.linspace(y, y + dy, 2)
    zz = np.linspace(z, z + dz, 2)

    xx, yy = np.meshgrid(xx, yy)

    ax.plot_surface(xx, yy, z)
    ax.plot_surface(xx, yy, z + dz)

    yy, zz = np.meshgrid(yy, zz)
    ax.plot_surface(x, yy, zz)
    ax.plot_surface(x + dx, yy, zz)

    xx, zz = np.meshgrid(xx, zz)
    ax.plot_surface(xx, y, zz)
    ax.plot_surface(xx, y + dy, zz)
    plt.title("Cube")
    plt.show()

def plot_linear_cube(x, y, z, dx, dy, dz, color='red'):
    fig = plt.figure()
    ax = Axes3D(fig)
    xx = [x, x, x+dx, x+dx, x]
    yy = [y, y+dy, y+dy, y, y]
    kwargs = {'alpha': 1, 'color': color}
    ax.plot3D(xx, yy, [z]*5, **kwargs)
    ax.plot3D(xx, yy, [z+dz]*5, **kwargs)
    ax.plot3D([x, x], [y, y], [z, z+dz], **kwargs)
    ax.plot3D([x, x], [y+dy, y+dy], [z, z+dz], **kwargs)
    ax.plot3D([x+dx, x+dx], [y+dy, y+dy], [z, z+dz], **kwargs)
    ax.plot3D([x+dx, x+dx], [y, y], [z, z+dz], **kwargs)
    plt.title('Cube')
    plt.show()
def sprt():
    mpl.rcParams['legend.fontsize'] = 10
    plt.rcParams['axes.unicode_minus'] = False
    plt.rcParams['font.sans-serif'] = ['SimHei']

    x= np.linspace(-4,4,2000)
    y = np.linspace(-4,4,2000)
    x,y=np.meshgrid(x,y)
    z = np.sin(np.sqrt(x**2+y**2))

    fig=plt.figure()
    ax = fig.gca(projection='3d')
    surf=ax.plot_surface(x,y,z, cmap=cm.coolwarm, linewidth=0, antialiased=False)
    fig.colorbar(surf, shrink=0.5, aspect=5)
    plt.show()
def qwer():
    mpl.rcParams['legend.fontsize'] = 10
    plt.rcParams['axes.unicode_minus'] = False
    plt.rcParams['font.sans-serif'] = ['SimHei']

    x = np.linspace(-4,4,1000)
    x,y=np.meshgrid(x,x)
    z = np.sin(y)*np.cos(x)
    fig=plt.figure()
    ax=fig.gca(projection='3d')
    surf=ax.plot_surface(x,y,z,cmap=cm.coolwarm,linewidth=0,antialiased=False)
    fig.colorbar(surf,shrink=2,aspect=40)
    plt.show()

if __name__ == "__main__":
    #qwer()
    #sprt()
    #gas()
    #cost()
    #function()
    #function2()
    plot_linear_cube(0, 0, 0, 100, 120, 130)
    plot_opaque_cube()
