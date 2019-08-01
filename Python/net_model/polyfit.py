import os
import matplotlib.pyplot as plt
import pymysql
names=[]
x_train=[];y_train=[]
os.chdir("D:\\大学资料\\数学建模校赛\\拟合数据")
def takeupinfo():
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

        plt.figure()
        plt.plot(x_train, y_train, color="green", label="train data")
        plt.title("transistor")
        plt.xlabel("number")
        plt.ylabel("mete_value")
        plt.show()
        y_train = []
        x_train = []
    db.commit()
    db.close()

if __name__ == "__main__":
    takeupinfo()