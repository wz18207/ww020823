import pymysql
import matplotlib.pyplot as plt
import os
names=[]
x_list=[];y_list=[]
def takeupinfo():
    os.mkdir('D:\\大学资料\\数学建模校赛\\图像数据\\1006000000004128')
    os.chdir("D:\\大学资料\\数学建模校赛\\图像数据\\1006000000004128")
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba",db="2019年校赛数模a题")
    cur = db.cursor()
    sql="select mete_name from data where device_id=1006000000004128 group by mete_name order by mete_name;"
    cur.execute(sql)
    name_list=cur.fetchall()
    for j in name_list:
        global names
        names.append(str(j[0]))
    print(names)
    for k in names:
        sql = "select mete_value from data where device_id=1006000000004128 and mete_name='%s' order by record_time;"%(k)
        cur.execute(sql)
        output_list=cur.fetchall()

        for i in output_list:
            global y_list
            y_list.append(float(i[0]))
        print(y_list)
        for i in range(len(y_list)):
            global x_list
            x_list.append(i + 1)
        print(x_list)
        plt.figure()
        plt.plot(x_list, y_list, 'g')
        plt.title("transistor")
        plt.xlabel("number")
        plt.ylabel("mete_value")
        plt.savefig('./%s.jpg'%(k))
        plt.show()
        y_list = []
        x_list = []
    db.commit()
    db.close()
if __name__ == "__main__":
    takeupinfo()
