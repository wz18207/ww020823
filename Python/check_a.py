import sys
import pymysql.cursors
import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
wr = []
def check_data():
    db = pymysql.connect(host = "localhost",port = 3306,user = "root",password = "as sysdba",db="2019年校赛数模a题")
    cur = db.cursor()
    try:
        with cur as cursor:
            sql = "select * from testing_data where mete_value>0;"
            cursor.execute(sql)
            results = cursor.fetchall()
            global wr
            for row in results:
                for col in row:
                    wr.append(col)
            print(wr)
    finally:
        db.commit()
    db.close()
def txt_csv():
    os.chdir("D:\大学资料\数学建模校赛\建模题\数据\A题数据\A题数据")
    csv = pd.read_csv('training_data.csv')
    txtDF = pd.DataFrame(csv)
    txtDF.to_csv('training_data.txt', index=False)
if __name__ == "__main__":
    check_data()