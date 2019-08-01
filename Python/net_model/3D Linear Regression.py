import os
import pymysql
import numpy as np
import pandas as pd
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
names=[]
x_train=[];y_train=[]
#os.chdir("D:\\大学资料\\数学建模校赛\\RNN")
def takeupinfo():
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba", db="2019年校赛数模a题")
    cur = db.cursor()
    sql = "select mete_name from training_data where device_id=1006000000004142 group by mete_name order by mete_name;"
    cur.execute(sql)
    name_list = cur.fetchall()
    for j in name_list:
        global names
        names.append(str(j[0]))
    print(names)
    for k in names:
        sql = "select mete_value from training_data where device_id=1006000000004142 and mete_name='%s' order by record_time;"%(k)
        cur.execute(sql)
        output_list = cur.fetchall()

        for i in output_list:
            global y_train
            y_train.append(float(i[0]))
        print(y_train)
        for i in range(len(y_train)):
            global x_train
            x_train.append(i + 1)
        print(x_train)

        x=x_train;x=np.array(x)
        y=y_train;y=np.array(y)

        fig = plt.figure()
        ax = Axes3D(fig)
        parameter0 = np.arange(-10, 10, 0.2)
        parameter1 = np.arange(-10, 10, 0.2)
        def func_j(p0, p1):
            sum = 0
            for i in range(0, 7):
                h = p0 + p1 * x_train[i]
                sum += (h - y_train[i]) ** 2
            sum = sum / 14
            return sum
        parameter0, parameter1 = np.meshgrid(parameter0, parameter1)
        z = func_j(parameter0, parameter1)
        surf = ax.plot_surface(parameter0, parameter1, z)
        min_value = np.min(z)
        min_index = np.argmin(z)
        print(np.unravel_index(min_index, z.shape))
        min_point = np.unravel_index(min_index, z.shape)
        min_x = min_point[0]
        min_y = min_point[1]
        print(parameter0[min_x][min_y])
        print(parameter1[min_x][min_y])
        #plt.savefig('./%s.jpg'%(k), bbox_inches='tight')
        plt.show()
        y_train = []
        x_train = []

    db.commit()
    db.close()
if __name__ == "__main__":
    takeupinfo()
