import matplotlib.pyplot as plt
import math
def function_B_clustors():
    t=[];y=[];y1=[];y2=[];y3=[]
    for i in range(0,25):
        t.append(i)
    t1=t[0:3];t2=t[3:23];t3=t[23:]
    for i in t1:
        y1.append(5*i)
    for i in t2:
        y2.append(10+2*(i-2))
    for i in t3:
        y3.append(50+5*(i-22))
    y=y1+y2+y3
    print(t)
    print(y)

    plt.figure()
    plt.plot(t,y)
    plt.show()
if __name__=="__main__":
    function_B_clustors()