import pymysql
import os
import codecs
import json
def input_text():
    os.chdir("D:\大学资料\数学建模校赛\图像数据")
    db = pymysql.connect(host="localhost",port = 3306,user="root",password="as sysdba",db='2019年校赛数模a题')
    cur = db.cursor()
    sql="select device_id from data group by device_id order by device_id;"
    cur.execute(sql)
    a=cur.fetchall()
    list_data=[]
    for i in a:
        list_data.append(i[0])
    list_data = list(map(int, list_data))
    file = open('data.txt', 'w')
    file.write(str(list_data))
    file.close()
def input_name():
    os.chdir("D:\大学资料\数学建模校赛\图像数据")
    db = pymysql.connect(host="localhost", port=3306, user="root", password="as sysdba", db='2019年校赛数模a题')
    cur = db.cursor()
    sql = "select device_id from data group by device_id order by device_id;"
    cur.execute(sql)
    a = cur.fetchall()
    list_data = []
    for i in a:
        list_data.append(i[0])
    list_data = list(map(int, list_data))
    for k in list_data:
        print(k)
        sql="select record_time from data where device_id = %d group by record_time order by record_time;"%(k)
        cur.execute(sql)
        j = cur.fetchall()
        record_time=[]
        for i in j:
            record_time.append(str(i[0]))
        print(record_time)
        sql = "select mete_value from data where device_id = %d group by mete_value order by record_time;" % (k)
        cur.execute(sql)
        m = cur.fetchall()
        mete_value=[]
        for i in m:
            mete_value.append(str(i[0]))
        print(mete_value)
if __name__ == "__main__":
    input_name()
