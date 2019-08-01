import numpy as np
import matplotlib.pyplot as plt

def zin_e():
    x=np.linspace(-3,3,10000)#自定义区间（下限，上限，步长）
    #区间个数
    y=[]
    for i in x:
        if i >= -3 and i < -1:
            y.append (((-1)*(i**2)-4*i-3)/2)
        elif i >=-1 and i <1:
            y.append(((-1)*i**2)+1)
        else:
            y.append(((i**2)-4*i-3)/2)
    y = np.array(y)
    plt.plot(x,y)
    plt.show()
if __name__ == '__main__':
    zin_e()