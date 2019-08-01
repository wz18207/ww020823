import numpy as np
import matplotlib.pyplot as plt
def pict():
    x = np.arange(-50.0, 50.0, 0.1)
    y1=-2636*x**7 + 8730*x**6 - 1221*x**5 + 9526*x**4 - 4464*x**3 + 1203*x**2 - 154.5*x + 30.66
    #y2=7450*x**7 -1863*x**6 + 1363*x**5 + 238.8*x**4 - 3910*x**3 + 1354*x**2 - 125.1*x + 27.02
    y3 = -615.4 * x ** 7 + 4099 * x ** 6 - 8055 * x ** 5 + 6712 * x ** 4 - 2460 * x ** 3 + 310.5 * x ** 2 + 13.13 * x + 25.7
    y4 = -1286 * x ** 7 + 5036 * x ** 6 - 7750 * x ** 5 + 5928 * x ** 4 - 2351 * x ** 3 + 4578 * x ** 2 - 361 * x + 35.95
    y5 = -3086 * x ** 7 + 1246 * x ** 6 - 1563 * x ** 5 + 9298 * x ** 4 - 2590 * x ** 3 + 260.8 * x ** 2 - 4.832 * x + 26.16
    y1 = np.array(y1)
    #y2 = np.array(y2)
    y3 = np.array(y3);y4 = np.array(y4);y5 = np.array(y5)
    plt.figure()
    plt.plot(x,y1,'g',label='7.26')
    #plt.plot(x,y2,'blue',label='7.27')
    plt.plot(x,y3,'r',label='7.28')
    plt.plot(x,y4,'black',label='7.29')
    plt.plot(x,y5,'y',label='7.30')
    plt.legend()
    plt.show()
def readcsv():
    import csv
    import os
    os.chdir("D:\\大学资料\\数学建模校赛\\拟合数据\\环境温度")
    with open('1006000000004466.csv', 'r') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            row_0=row[0]
            row_0=float(row_0)
        rows = bin(row_0)
    print(rows)

if __name__ == "__main__":
    pict()