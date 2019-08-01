#np为从numpy模块儿中引用数组模块儿
import numpy as np
#此模块儿为绘制图像模块儿
import matplotlib.pyplot as plt
#a = np.arange(55).reshape(11,5)
#print(a) #a数组的全部
#print(a.ndim) #a数组中轴的数量
#print(a.dtype.name) #a数组中元素类型
#print(a.shape) #a数组的维度
#print(a.size) #a数组的元素总数
#print(a.data) #缓冲区实际包含数组的元素
#print(a.itemsize) #a数组的每个元素的字节大小

#a = np.array([2.2,3.3,4.4])
#print(a.dtype)

#b数组中dtype为加入复数形式
#b = np.array([(2.3,4.5,6.7),(2.3,4.5,6.7)],dtype=complex)
#print(b)

#c为0和1的数组时可以为此形式，其他的数组必须要有中括号。
#c=np.zeros((3,4))
#print(c)

#此处可以限制数组中元素的数据类型和数据范围。
#d=np.ones((2,3,4),dtype=np.int32)
#print(d)

#空元素矩阵的元素范围
#print(np.empty((2,3)))

#写出以为矩阵的元素步长
#print(np.arange(10,43,5))

#从numpy模块中引用pi元素
from numpy import pi
#print(np.linspace(0,2,9))

#此为离散函数
#x=np.linspace(0,2*pi,100)
#f=np.sin(x)
#画图，选择参数
#plt.plot(f,x)
#显示图像
#plt.show()

#numpy模块儿可以自动跳过长度过长的中间部分
#print(np.arange(10000))
#print(np.arange(10000).reshape(100,100))
#禁止省略行为
#np.set_printoptions(threshold=np.nan)

#A=np.array([[0,1],[1,1]])
#B=np.array([[2,0],[3,4]])
#矩阵内积
#print(A*B)
#矩阵外积
#print(A@B) #print(A.dot(B))

#改变现有数组
a=np.ones((2,3),dtype=int)
b=np.random.random((2,3))
a*=3;b+=a
print(a);print(b)


