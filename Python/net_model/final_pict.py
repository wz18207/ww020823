import pymysql
import os
import matplotlib.pyplot as plt
import numpy as np
os.chdir("D:\\大学资料\\数学建模校赛\\RNN")
def finalinfo():
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba", db="2019年校赛数模a题")
    cur = db.cursor()
    sql = "select mete_value from forecast order by id;"
    cur.execute(sql)
    y_list=[]
    for k in cur.fetchall():
        y_list.append(k[0])
    print(y_list)
    sql = "select id from forecast;"
    cur.execute(sql)
    x_list = []
    for k in cur.fetchall():
        x_list.append(k[0])
    print(x_list)
    x=x_list;x=np.array(x)
    y=y_list;y=np.array(y)
    fig = plt.figure()
    plt.xticks(np.linspace(0, 125, 20))
    plt.yticks([19,36])
    plt.plot(x, y, 'g')
    plt.title("transistor")
    plt.xlabel("number")
    plt.ylabel("mete_value")
    fig.tight_layout()
    plt.show()
if __name__ == "__main__":
    finalinfo()