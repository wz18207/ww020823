import pymysql
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import leastsq
import os
names=[]
x_train=[];y_train=[]
def takeupinfo():
    os.chdir("D:\\大学资料\\数学建模校赛\\拟合数据\\1006000000004128")
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba", db="2019年校赛数模a题")
    cur = db.cursor()
    sql = "select mete_name from training_data where device_id=1006000000004128 group by mete_name order by mete_name;"
    cur.execute(sql)
    name_list = cur.fetchall()
    for j in name_list:
        global names
        names.append(str(j[0]))
    print(names)
    for k in names:
        sql = "select mete_value from training_data where device_id=1006000000004128 and mete_name='%s' order by record_time;" %(k)
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

        def hypothesis_func(w, x):
            w1, w0 = w
            return w1 * x + w0
        def error_func(w, train_x, train_y, msg):
            print(msg)
            return hypothesis_func(w, train_x) - train_y
        def dump_fit_func(w_fit):
            w1, w0 = w_fit
            print("fitting line=", str(w1) + "*x + " + str(w0))
            return
        def dump_fit_cost(w_fit, train_x, train_y):
            error = error_func(w_fit, train_x, train_y, "")
            square_error = sum(e * e for e in error)
            print('fitting cost:', str(square_error))
            return square_error

        x = x_train;x = np.array(x)
        y = y_train;y = np.array(y)

        msg = "invoke scipy leastsq"
        w_init = [20, 1]  # weight factor init
        fit_ret = leastsq(error_func, w_init, args=(x, y, msg))
        w_fit = fit_ret[0]
        dump_fit_func(w_fit)
        dump_fit_cost(w_fit, x, y)
        test_x = np.array(np.arange(x.min(), x.max(), 1.0))
        test_y = hypothesis_func(w_fit, test_x)
        plt.figure(1)
        plt.figure(figsize=(8, 6))  # 指定图像比例： 8：6
        plt.title('linear regression by scipy leastsq')
        plt.plot(x, y, color='b', label='train set')
        plt.scatter(test_x, test_y, color='r', marker='^', label='test set', linewidth=2)
        plt.plot(test_x, test_y, color='r', label='fitting line')
        plt.legend(loc='lower right')
        plt.savefig('./%s.jpg' % (k))
        plt.show()
        y_train = []
        x_train = []
    db.commit()
    db.close()

if __name__ == "__main__":
    takeupinfo()