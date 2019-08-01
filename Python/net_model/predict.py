import pymysql
import numpy as np
names=[]
x_train=[];y_train=[]
def takeupinfo():
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba", db="2019年校赛数模a题")
    cur = db.cursor()
    sql = "select mete_name from training_data where device_id=1006000000004152 group by mete_name order by mete_name;"
    cur.execute(sql)
    name_list = cur.fetchall()
    for j in name_list:
        global names
        names.append(str(j[0]))
    print(names)
    for k in names:
        sql = "select mete_value from training_data where device_id=1006000000004152 and mete_name='%s' order by record_time;" %(k)
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

        print(np.mean(y_train))
        print(np.median(y_train))
if __name__ == "__main__":
    takeupinfo()